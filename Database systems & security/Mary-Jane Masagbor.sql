CREATE TABLE ACCESS_LOG 
    ( 
     access_id        VARCHAR2 (10)  NOT NULL , 
     member_id        VARCHAR2 (10)  NOT NULL , 
     booking_id       VARCHAR2 (10)  NOT NULL , 
     access_time      TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     access_result    VARCHAR2 (10)  NOT NULL , 
     door_location    VARCHAR2 (10)  NOT NULL , 
     MEMBER_member_id VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE ACCESS_LOG 
    ADD CONSTRAINT ACCESS_LOG_PK PRIMARY KEY ( access_id ) ;

CREATE TABLE BOOKING 
    ( 
     booking_id       VARCHAR2 (20)  NOT NULL , 
     member_id        VARCHAR2 (20)  NOT NULL , 
     room_id          VARCHAR2 (20)  NOT NULL , 
     start_time       TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     end_time         TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     booking_status   VARCHAR2 (20)  NOT NULL , 
     created_at       TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     payment_amount   VARCHAR2 (20)  NOT NULL , 
     payment_method   VARCHAR2 (20)  NOT NULL , 
     payment_status   VARCHAR2 (20)  NOT NULL , 
     paid_at          TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     ROOM_room_id     VARCHAR2 (20)  NOT NULL , 
     MEMBER_member_id VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE BOOKING 
    ADD CONSTRAINT BOOKING_PK PRIMARY KEY ( booking_id ) ;

CREATE TABLE MEMBER 
    ( 
     member_id    VARCHAR2 (20)  NOT NULL , 
     plan_id      VARCHAR2 (10)  NOT NULL , 
     full_name    VARCHAR2 (20)  NOT NULL , 
     email        VARCHAR2 (20)  NOT NULL , 
     phone        VARCHAR2 (20)  NOT NULL , 
     status       VARCHAR2 (20)  NOT NULL , 
     join_date    DATE  NOT NULL , 
     PLAN_plan_id VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE MEMBER 
    ADD CONSTRAINT MEMBER_PK PRIMARY KEY ( member_id ) ;

ALTER TABLE MEMBER 
    ADD CONSTRAINT MEMBER_email_UN UNIQUE ( email ) ;

CREATE TABLE PLAN 
    ( 
     plan_id                VARCHAR2 (10)  NOT NULL , 
     plan_name              VARCHAR2 (10)  NOT NULL , 
     monthly_fee            VARCHAR2 (12)  NOT NULL , 
     max_monthly_room_hours VARCHAR2 (12)  NOT NULL 
    ) 
;

ALTER TABLE PLAN 
    ADD CONSTRAINT PLAN_PK PRIMARY KEY ( plan_id ) ;

ALTER TABLE PLAN 
    ADD CONSTRAINT PLAN_plan_name_UN UNIQUE ( plan_name ) ;

CREATE TABLE ROOM 
    ( 
     room_id     VARCHAR2 (20)  NOT NULL , 
     room_name   VARCHAR2 (20)  NOT NULL , 
     room_type   VARCHAR2 (20)  NOT NULL , 
     capacity    VARCHAR2 (20)  NOT NULL , 
     hourly_rate VARCHAR2 (20)  NOT NULL , 
     is_active   VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE ROOM 
    ADD CONSTRAINT ROOM_PK PRIMARY KEY ( room_id ) ;

ALTER TABLE ROOM 
    ADD CONSTRAINT ROOM_room_name_UN UNIQUE ( room_name ) ;

ALTER TABLE ACCESS_LOG 
    ADD CONSTRAINT ACCESS_LOG_MEMBER_FK FOREIGN KEY 
    ( 
     MEMBER_member_id
    ) 
    REFERENCES MEMBER 
    ( 
     member_id
    ) 
;

ALTER TABLE BOOKING 
    ADD CONSTRAINT BOOKING_MEMBER_FK FOREIGN KEY 
    ( 
     MEMBER_member_id
    ) 
    REFERENCES MEMBER 
    ( 
     member_id
    ) 
;

ALTER TABLE BOOKING 
    ADD CONSTRAINT BOOKING_ROOM_FK FOREIGN KEY 
    ( 
     ROOM_room_id
    ) 
    REFERENCES ROOM 
    ( 
     room_id
    ) 
;

ALTER TABLE MEMBER 
    ADD CONSTRAINT MEMBER_PLAN_FK FOREIGN KEY 
    ( 
     PLAN_plan_id
    ) 
    REFERENCES PLAN 
    ( 
     plan_id
    ) 
;


BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE access_log';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE payment';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE booking';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE room';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE member';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE plan';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/


CREATE TABLE PLAN
(
  plan_id                VARCHAR2(10) NOT NULL,
  plan_name              VARCHAR2(10) NOT NULL,
  monthly_fee            VARCHAR2(12) NOT NULL,
  max_monthly_room_hours VARCHAR2(12) NOT NULL
);

ALTER TABLE PLAN
  ADD CONSTRAINT PLAN_PK PRIMARY KEY (plan_id);

ALTER TABLE PLAN
  ADD CONSTRAINT PLAN_plan_name_UN UNIQUE (plan_name);

CREATE TABLE MEMBER
(
  member_id    VARCHAR2(20) NOT NULL,
  plan_id      VARCHAR2(10) NOT NULL,
  full_name    VARCHAR2(20) NOT NULL,
  email        VARCHAR2(20) NOT NULL,
  phone        VARCHAR2(20) NOT NULL,
  status       VARCHAR2(20) NOT NULL,
  join_date    DATE NOT NULL,
  PLAN_plan_id VARCHAR2(10) NOT NULL
);

ALTER TABLE MEMBER
  ADD CONSTRAINT MEMBER_PK PRIMARY KEY (member_id);

ALTER TABLE MEMBER
  ADD CONSTRAINT MEMBER_email_UN UNIQUE (email);

ALTER TABLE MEMBER
  ADD CONSTRAINT MEMBER_PLAN_FK FOREIGN KEY (PLAN_plan_id)
  REFERENCES PLAN (plan_id);

CREATE TABLE ROOM
(
  room_id     VARCHAR2(20) NOT NULL,
  room_name   VARCHAR2(20) NOT NULL,
  room_type   VARCHAR2(20) NOT NULL,
  capacity    VARCHAR2(20) NOT NULL,
  hourly_rate VARCHAR2(20) NOT NULL,
  is_active   VARCHAR2(20) NOT NULL
);

ALTER TABLE ROOM
  ADD CONSTRAINT ROOM_PK PRIMARY KEY (room_id);

ALTER TABLE ROOM
  ADD CONSTRAINT ROOM_room_name_UN UNIQUE (room_name);

CREATE TABLE BOOKING
(
  booking_id       VARCHAR2(20) NOT NULL,
  member_id        VARCHAR2(20) NOT NULL,
  room_id          VARCHAR2(20) NOT NULL,
  start_time       TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
  end_time         TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
  booking_status   VARCHAR2(20) NOT NULL,
  created_at       TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
  payment_amount   VARCHAR2(20) NOT NULL,
  payment_method   VARCHAR2(20) NOT NULL,
  payment_status   VARCHAR2(20) NOT NULL,
  paid_at          TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
  ROOM_room_id     VARCHAR2(20) NOT NULL,
  MEMBER_member_id VARCHAR2(20) NOT NULL
);

ALTER TABLE BOOKING
  ADD CONSTRAINT BOOKING_PK PRIMARY KEY (booking_id);

ALTER TABLE BOOKING
  ADD CONSTRAINT BOOKING_MEMBER_FK FOREIGN KEY (MEMBER_member_id)
  REFERENCES MEMBER (member_id);

ALTER TABLE BOOKING
  ADD CONSTRAINT BOOKING_ROOM_FK FOREIGN KEY (ROOM_room_id)
  REFERENCES ROOM (room_id);

CREATE TABLE ACCESS_LOG
(
  access_id        VARCHAR2(10) NOT NULL,
  member_id        VARCHAR2(10) NOT NULL,
  booking_id       VARCHAR2(10) NOT NULL,
  access_time      TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
  access_result    VARCHAR2(10) NOT NULL,
  door_location    VARCHAR2(10) NOT NULL,
  MEMBER_member_id VARCHAR2(20) NOT NULL
);

ALTER TABLE ACCESS_LOG
  ADD CONSTRAINT ACCESS_LOG_PK PRIMARY KEY (access_id);

ALTER TABLE ACCESS_LOG
  ADD CONSTRAINT ACCESS_LOG_MEMBER_FK FOREIGN KEY (MEMBER_member_id)
  REFERENCES MEMBER (member_id);


INSERT INTO PLAN (plan_id, plan_name, monthly_fee, max_monthly_room_hours)
VALUES ('P1', 'Starter', '50.00', '5.0');

INSERT INTO PLAN (plan_id, plan_name, monthly_fee, max_monthly_room_hours)
VALUES ('P2', 'Pro', '120.00', '15.0');

INSERT INTO MEMBER (member_id, plan_id, full_name, email, phone, status, join_date, PLAN_plan_id)
VALUES ('M1', 'P1', 'Ada Okafor', 'ada@cohub.com', '0700000001', 'ACTIVE', DATE '2026-02-01', 'P1');

INSERT INTO MEMBER (member_id, plan_id, full_name, email, phone, status, join_date, PLAN_plan_id)
VALUES ('M2', 'P2', 'Ben Hughes', 'ben@cohub.com', '0700000002', 'ACTIVE', DATE '2026-02-10', 'P2');

INSERT INTO ROOM (room_id, room_name, room_type, capacity, hourly_rate, is_active)
VALUES ('R1', 'RoomA', 'MEETING', '6', '20.00', 'Y');

INSERT INTO ROOM (room_id, room_name, room_type, capacity, hourly_rate, is_active)
VALUES ('R2', 'Pod1', 'POD', '1', '8.00', 'Y');

INSERT INTO BOOKING (
  booking_id, member_id, room_id,
  start_time, end_time, booking_status, created_at,
  payment_amount, payment_method, payment_status, paid_at,
  ROOM_room_id, MEMBER_member_id
) VALUES (
  'B1', 'M1', 'R1',
  TIMESTAMP '2026-03-02 10:00:00', TIMESTAMP '2026-03-02 12:00:00',
  'CONFIRMED', TIMESTAMP '2026-03-01 18:00:00',
  '40.00', 'CARD', 'PAID', TIMESTAMP '2026-03-01 18:30:00',
  'R1', 'M1'
);

INSERT INTO BOOKING (
  booking_id, member_id, room_id,
  start_time, end_time, booking_status, created_at,
  payment_amount, payment_method, payment_status, paid_at,
  ROOM_room_id, MEMBER_member_id
) VALUES (
  'B2', 'M2', 'R2',
  TIMESTAMP '2026-03-02 09:00:00', TIMESTAMP '2026-03-02 10:00:00',
  'COMPLETED', TIMESTAMP '2026-03-02 08:30:00',
  '8.00', 'BANK', 'PAID', TIMESTAMP '2026-03-02 08:55:00',
  'R2', 'M2'
);

INSERT INTO ACCESS_LOG (
  access_id, member_id, booking_id,
  access_time, access_result, door_location,
  MEMBER_member_id
) VALUES (
  'A1', 'M1', 'B1',
  TIMESTAMP '2026-03-02 09:50:00', 'GRANTED', 'MAIN',
  'M1'
);

INSERT INTO ACCESS_LOG (
  access_id, member_id, booking_id,
  access_time, access_result, door_location,
  MEMBER_member_id
) VALUES (
  'A2', 'M2', 'B2',
  TIMESTAMP '2026-03-02 08:40:00', 'DENIED', 'MAIN',
  'M2'
);

INSERT INTO ACCESS_LOG (
  access_id, member_id, booking_id,
  access_time, access_result, door_location,
  MEMBER_member_id
) VALUES (
  'A3', 'M2', 'B2',
  TIMESTAMP '2026-03-03 23:10:00', 'DENIED', 'SIDE',
  'M2'
);

COMMIT;

SELECT * FROM PLAN ORDER BY plan_id;
SELECT * FROM MEMBER ORDER BY member_id;
SELECT * FROM ROOM ORDER BY room_id;
SELECT * FROM BOOKING ORDER BY booking_id;
SELECT * FROM ACCESS_LOG ORDER BY access_id;
