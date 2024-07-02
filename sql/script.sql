create table if not exists department_code
(
    DEPARTMENT_ID   int         not null comment '部门代码'
        primary key,
    DEPARTMENT_NAME varchar(20) null comment '部门名称'
)
    charset = utf8mb3
    row_format = COMPACT;

create table if not exists report_info
(
    REPORT_ID         int auto_increment
        primary key,
    CREATE_DATE       datetime    null,
    DEPARTMENT_ID     int         null,
    DEPARTMENT_NAME   varchar(20) null,
    DAY_LATE_COUNT    int         null comment '部门当天迟到人次统计',
    DAY_EARLY_COUNT   int         null comment '部门当天早退人次统计',
    MONTH_LATE_COUNT  int         null comment '部门当月迟到人次统计',
    MONTH_EARLY_COUNT int         null comment '部门当月早退人次统计',
    YEAR_LATE_COUNT   int         null comment '部门当年迟到人次统计',
    YEAR_EARLY_COUNT  int         null comment '部门当年迟到人次统计',
    constraint report_info_ibfk_1
        foreign key (DEPARTMENT_ID) references department_code (DEPARTMENT_ID)
            on delete set null
)
    charset = utf8mb3
    row_format = COMPACT;

create table if not exists report_detail
(
    DETAIL_ID         int auto_increment
        primary key,
    REPORT_ID         int         null,
    CREATE_DATE       datetime    null,
    DEPARTMENT_ID     int         null,
    DEPARTMENT_NAME   varchar(20) null,
    STAFF_ID          varchar(20) null,
    STAFF_NAME        varchar(20) null,
    DAY_LATE_COUNT    int         null comment '部门当天迟到人次统计',
    DAY_EARLY_COUNT   int         null comment '部门当天早退人次统计',
    MONTH_LATE_COUNT  int         null comment '部门当月迟到人次统计',
    MONTH_EARLY_COUNT int         null comment '部门当月早退人次统计',
    YEAR_LATE_COUNT   int         null comment '部门当年迟到人次统计',
    YEAR_EARLY_COUNT  int         null comment '部门当年迟到人次统计',
    constraint report_detail_ibfk_1
        foreign key (REPORT_ID) references report_info (REPORT_ID)
            on delete set null
)
    charset = utf8mb3
    row_format = COMPACT;

create index REPORT_ID
    on report_detail (REPORT_ID);

create index DEPARTMENT_ID
    on report_info (DEPARTMENT_ID);

create table if not exists role
(
    ROLE_ID     int          not null
        primary key,
    ROLE_NAME   varchar(20)  not null,
    PERMISSIONS varchar(255) null comment '权限'
)
    charset = utf8mb3
    row_format = COMPACT;

create table if not exists staff
(
    STAFF_ID      varchar(20) not null comment '用户编号'
        primary key,
    STAFF_NAME    varchar(20) not null comment '用户名',
    SEX           varchar(20) null comment '性别',
    DEPARTMENT_ID int         null comment '部门编号',
    ROLE          int         null comment '权限',
    GRADE         date        null comment '入职日期',
    BIRTHDAY      date        null comment '出生日期',
    TEL           varchar(20) null comment '手机号',
    EMAIL         varchar(20) null comment '邮箱',
    HOBBY         varchar(50) null comment '爱好',
    PASSWORD      varchar(20) null comment '登录密码',
    constraint staff_ibfk_1
        foreign key (DEPARTMENT_ID) references department_code (DEPARTMENT_ID)
            on delete set null,
    constraint staff_ibfk_2
        foreign key (ROLE) references role (ROLE_ID)
            on delete set null
)
    charset = utf8mb3
    row_format = COMPACT;

create table if not exists leave_record
(
    RECORD_ID         int auto_increment comment '记录编号'
        primary key,
    DEPARTMENT_ID     int          null comment '部门编号',
    STAFF_ID          varchar(11)  null comment '员工编号',
    HANIN_TIME        datetime     null comment '申请时间',
    LEAVE_START_TIME  datetime     null comment '假期开始时间',
    LEAVE_END_TIME    datetime     null comment '假期结束时间',
    APPLICATION_STATE varchar(20)  null comment '申请状态0.待审核1.通过2.不通过',
    REASON            varchar(100) null comment '请假事由',
    REPLY             varchar(100) null comment '审批片语',
    HANDLE_TIME       datetime     null comment '处理时间',
    constraint leave_record_ibfk_1
        foreign key (DEPARTMENT_ID) references department_code (DEPARTMENT_ID)
            on delete set null,
    constraint leave_record_ibfk_2
        foreign key (STAFF_ID) references staff (STAFF_ID)
)
    charset = utf8mb3
    row_format = COMPACT;

create index DEPARTMENT_ID
    on leave_record (DEPARTMENT_ID);

create index STAFF_ID
    on leave_record (STAFF_ID);

create table if not exists sign_record
(
    RECORD_ID      int auto_increment comment '签到记录编号'
        primary key,
    DEPARTMENT_ID  int         null comment '部门编号',
    STAFF_ID       varchar(11) null comment '员工编号',
    SIGN_IN_TIME   datetime    null comment '签到时间',
    SIGN_IN_STATE  varchar(20) null comment '1-迟到 0-正常 null-未签到',
    SIGN_OUT_TIME  datetime    null comment '签退时间',
    SIGN_OUT_STATE varchar(20) null comment '1-早退 0-正常 null-未签退',
    UPDATE_TIME    datetime    null comment '记录更新时间',
    constraint sign_record_ibfk_1
        foreign key (DEPARTMENT_ID) references sys_dept (dept_id)
            on delete set null,
    constraint sign_record_ibfk_2
        foreign key (STAFF_ID) references sys_user (user_id)
            on delete set null
)
    charset = utf8mb3
    row_format = COMPACT;

create index DEPARTMENT_ID
    on sign_record (DEPARTMENT_ID);

create index STAFF_ID
    on sign_record (STAFF_ID);

create index DEPARTMENT_ID
    on staff (DEPARTMENT_ID);

create index ROLE
    on staff (ROLE);

create
    definer = root@localhost procedure SIGN_REPORT_PROC(IN PARAM_DATE varchar(20), IN DEPARTMENT int)
BEGIN
    /*声明变量*/
    DECLARE V_DEPARTMENT INT;
    DECLARE V_DEPARTMENT_NAME CHAR(20);
    DECLARE V_STAFF_ID CHAR(20);
    DECLARE V_STAFF_NAME CHAR(20);
    DECLARE V_REPORT_ID INT;
    DECLARE V_DAY_LATE_COUNT, V_MONTH_LATE_COUNT, V_YEAR_LATE_COUNT INT DEFAULT 0;
    DECLARE V_DAY_EARLY_COUNT,V_MONTH_EARLY_COUNT, V_YEAR_EARLY_COUNT INT DEFAULT 0;


    /*声明游标*/
    DECLARE CURSOR_STAFF_ID CURSOR FOR SELECT STAFF_ID, STAFF_NAME
                                       FROM STAFF
                                       WHERE DEPARTMENT_ID = DEPARTMENT;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET V_STAFF_ID = NULL;
    /*创建临时表*/
    DROP TABLE IF EXISTS TEMP_REPORT;
    CREATE TEMPORARY TABLE TEMP_REPORT
    (
        RECORD_ID      INT(11) NOT NULL,
        DEPARTMENT_ID  INT(11),
        STAFF_ID       INT(11),
        SIGN_IN_TIME   DATETIME,
        SIGN_IN_STATE  VARCHAR(20),
        SIGN_OUT_TIME  DATETIME,
        SIGN_OUT_STATE VARCHAR(20),
        UPDATE_TIME    DATETIME,
        PRIMARY KEY (RECORD_ID)
    ) ENGINE = InnoDB
      DEFAULT CHARSET = utf8;

    INSERT INTO TEMP_REPORT
    SELECT *
    FROM SIGN_RECORD
    WHERE DEPARTMENT_ID = DEPARTMENT
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') <= PARAM_DATE;

    /*按日统计*/
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
      AND SIGN_IN_STATE = '1'
    INTO V_DAY_LATE_COUNT;
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
      AND SIGN_OUT_STATE = '1'
    INTO V_DAY_EARLY_COUNT;

    /*按月统计*/
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
      AND SIGN_IN_STATE = '1'
    INTO V_MONTH_LATE_COUNT;
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
      AND SIGN_OUT_STATE = '1'
    INTO V_MONTH_EARLY_COUNT;

    /*按年统计*/
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
      AND SIGN_IN_STATE = '1'
    INTO V_YEAR_LATE_COUNT;
    SELECT COUNT(*)
    FROM TEMP_REPORT
    WHERE (RECORD_ID IS NOT NULL AND RECORD_ID != '')
      AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
      AND SIGN_OUT_STATE = '1'
    INTO V_YEAR_EARLY_COUNT;

    /* 统计部门代码翻译 */
    SELECT DEPARTMENT_NAME FROM DEPARTMENT_CODE WHERE DEPARTMENT_ID = DEPARTMENT INTO V_DEPARTMENT_NAME;
    /* 保存统计数据 */
    INSERT INTO REPORT_INFO(CREATE_DATE, DEPARTMENT_ID, DEPARTMENT_NAME, DAY_LATE_COUNT, DAY_EARLY_COUNT,
                            MONTH_LATE_COUNT, MONTH_EARLY_COUNT, YEAR_LATE_COUNT, YEAR_EARLY_COUNT)
    VALUES (PARAM_DATE, DEPARTMENT, V_DEPARTMENT_NAME, V_DAY_LATE_COUNT, V_DAY_EARLY_COUNT, V_MONTH_LATE_COUNT,
            V_MONTH_EARLY_COUNT, V_YEAR_LATE_COUNT, V_YEAR_EARLY_COUNT);

    /* 获取自增的REPORT_ID */
    SET V_REPORT_ID = LAST_INSERT_ID();

    OPEN CURSOR_STAFF_ID;
    FETCH CURSOR_STAFF_ID INTO V_STAFF_ID, V_STAFF_NAME;
    WHILE (V_STAFF_ID IS NOT NULL)
        DO
            /*按日统计*/
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_IN_STATE = '1'
            INTO V_DAY_LATE_COUNT;
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m-%d') = PARAM_DATE
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_OUT_STATE = '1'
            INTO V_DAY_EARLY_COUNT;

            /*按月统计*/
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_IN_STATE = '1'
            INTO V_MONTH_LATE_COUNT;
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y-%m') = SUBSTRING(PARAM_DATE, 1, 7)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_OUT_STATE = '1'
            INTO V_MONTH_EARLY_COUNT;

            /*按年统计*/
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_IN_STATE = '1'
            INTO V_YEAR_LATE_COUNT;
            SELECT COUNT(*)
            FROM TEMP_REPORT
            WHERE STAFF_ID = V_STAFF_ID
              AND DATE_FORMAT(UPDATE_TIME, '%Y') = SUBSTRING(PARAM_DATE, 1, 4)
              AND DEPARTMENT_ID = DEPARTMENT
              AND SIGN_OUT_STATE = '1'
            INTO V_YEAR_EARLY_COUNT;

            INSERT INTO REPORT_DETAIL(REPORT_ID, CREATE_DATE, DEPARTMENT_ID, DEPARTMENT_NAME, STAFF_ID, STAFF_NAME,
                                      DAY_LATE_COUNT, DAY_EARLY_COUNT, MONTH_LATE_COUNT, MONTH_EARLY_COUNT,
                                      YEAR_LATE_COUNT, YEAR_EARLY_COUNT)
            VALUES (V_REPORT_ID, PARAM_DATE, DEPARTMENT, V_DEPARTMENT_NAME, V_STAFF_ID, V_STAFF_NAME, V_DAY_LATE_COUNT,
                    V_DAY_EARLY_COUNT, V_MONTH_LATE_COUNT, V_MONTH_EARLY_COUNT, V_YEAR_LATE_COUNT, V_YEAR_EARLY_COUNT);
            FETCH CURSOR_STAFF_ID INTO V_STAFF_ID, V_STAFF_NAME;
        END WHILE;
    CLOSE CURSOR_STAFF_ID;

END;


