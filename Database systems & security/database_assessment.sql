REM   Script: Database Assessment
-- STEP: 1.null



SELECT
  m.full_name,
  a.access_time,
  a.access_result,
  a.door_location,
  a.booking_id
FROM ACCESS_LOG a
JOIN MEMBER m ON a.MEMBER_member_id = m.member_id
WHERE a.access_result = 'DENIED'
   OR EXTRACT(HOUR FROM a.access_time) >= 22
ORDER BY a.access_time DESC;




-- STEP: 2.null



SELECT
  r.room_name,
  COUNT(*) AS paid_bookings,
  SUM(TO_NUMBER(b.payment_amount)) AS total_revenue
FROM BOOKING b
JOIN ROOM r ON b.ROOM_room_id = r.room_id
WHERE b.payment_status = 'PAID'
GROUP BY r.room_name
ORDER BY total_revenue DESC;




-- STEP: 3.null



SELECT
  m.full_name,
  m.email,
  r.room_name,
  b.start_time,
  b.end_time,
  b.booking_status,
  b.payment_status,
  b.payment_amount
FROM BOOKING b
JOIN MEMBER m ON b.MEMBER_member_id = m.member_id
JOIN ROOM r ON b.ROOM_room_id = r.room_id
ORDER BY b.start_time;




-- STEP: 4.null



SELECT * FROM ACCESS_LOG ORDER BY access_id;




-- STEP: 5.null



SELECT * FROM BOOKING ORDER BY booking_id;




-- STEP: 6.null



SELECT * FROM ROOM ORDER BY room_id;




-- STEP: 7.null



SELECT * FROM MEMBER ORDER BY member_id;




-- STEP: 8.null



SELECT * FROM PLAN ORDER BY plan_id;




-- STEP: 9.null



SELECT * FROM MEMBER ORDER BY member_id;




-- STEP: 10.null



SELECT * FROM PLAN ORDER BY plan_id;




-- STEP: 11.null



SELECT * FROM ACCESS_LOG ORDER BY access_id;




-- STEP: 12.null



SELECT * FROM ROOM ORDER BY room_id;




-- STEP: 13.null



SELECT * FROM BOOKING ORDER BY booking_id;




-- STEP: 14.null



SELECT * FROM MEMBER ORDER BY member_id;




-- STEP: 15.null



SELECT * FROM PLAN ORDER BY plan_id;




-- STEP: 16.null



COMMIT;




-- STEP: 17.null



INSERT INTO ACCESS_LOG (
  access_id, member_id, booking_id,
  access_time, access_result, door_location,
  MEMBER_member_id
) VALUES (
  'A3', 'M2', 'B2',
  TIMESTAMP '2026-03-03 23:10:00', 'DENIED', 'SIDE',
  'M2'
);




-- STEP: 18.null



INSERT INTO ACCESS_LOG (
  access_id, member_id, booking_id,
  access_time, access_result, door_location,
  MEMBER_member_id
) VALUES (
  'A2', 'M2', 'B2',
  TIMESTAMP '2026-03-02 08:40:00', 'DENIED', 'MAIN',
  'M2'
);




-- STEP: 19.null



INSERT INTO ACCESS_LOG (
  access_id, member_id, booking_id,
  access_time, access_result, door_location,
  MEMBER_member_id
) VALUES (
  'A1', 'M1', 'B1',
  TIMESTAMP '2026-03-02 09:50:00', 'GRANTED', 'MAIN',
  'M1'
);




-- STEP: 20.null



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




-- STEP: 21.null



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




-- STEP: 22.null



INSERT INTO ROOM (room_id, room_name, room_type, capacity, hourly_rate, is_active)
VALUES ('R1', 'RoomA', 'MEETING', '6', '20.00', 'Y');




-- STEP: 23.null



INSERT INTO ROOM (room_id, room_name, room_type, capacity, hourly_rate, is_active)
VALUES ('R2', 'Pod1', 'POD', '1', '8.00', 'Y');




-- STEP: 24.null



INSERT INTO MEMBER (member_id, plan_id, full_name, email, phone, status, join_date, PLAN_plan_id)
VALUES ('M2', 'P2', 'Ben Hughes', 'ben@cohub.com', '0700000002', 'ACTIVE', DATE '2026-02-10', 'P2');




-- STEP: 25.null



INSERT INTO MEMBER (member_id, plan_id, full_name, email, phone, status, join_date, PLAN_plan_id)
VALUES ('M1', 'P1', 'Ada Okafor', 'ada@cohub.com', '0700000001', 'ACTIVE', DATE '2026-02-01', 'P1');




-- STEP: 26.null



INSERT INTO PLAN (plan_id, plan_name, monthly_fee, max_monthly_room_hours)
VALUES ('P2', 'Pro', '120.00', '15.0');




-- STEP: 27.null



INSERT INTO PLAN (plan_id, plan_name, monthly_fee, max_monthly_room_hours)
VALUES ('P1', 'Starter', '50.00', '5.0');




-- STEP: 28.null



ALTER TABLE ACCESS_LOG
  ADD CONSTRAINT ACCESS_LOG_PK PRIMARY KEY (access_id);




-- STEP: 29.null



ALTER TABLE ACCESS_LOG
  ADD CONSTRAINT ACCESS_LOG_MEMBER_FK FOREIGN KEY (MEMBER_member_id)
  REFERENCES MEMBER (member_id);




-- STEP: 30.null



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




-- STEP: 31.null



ALTER TABLE BOOKING
  ADD CONSTRAINT BOOKING_ROOM_FK FOREIGN KEY (ROOM_room_id)
  REFERENCES ROOM (room_id);




-- STEP: 32.null



ALTER TABLE BOOKING
  ADD CONSTRAINT BOOKING_MEMBER_FK FOREIGN KEY (MEMBER_member_id)
  REFERENCES MEMBER (member_id);




-- STEP: 33.null



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




-- STEP: 34.null



ALTER TABLE BOOKING
  ADD CONSTRAINT BOOKING_PK PRIMARY KEY (booking_id);




-- STEP: 35.null



ALTER TABLE ROOM
  ADD CONSTRAINT ROOM_room_name_UN UNIQUE (room_name);




-- STEP: 36.null



ALTER TABLE ROOM
  ADD CONSTRAINT ROOM_PK PRIMARY KEY (room_id);




-- STEP: 37.null



CREATE TABLE ROOM
(
  room_id     VARCHAR2(20) NOT NULL,
  room_name   VARCHAR2(20) NOT NULL,
  room_type   VARCHAR2(20) NOT NULL,
  capacity    VARCHAR2(20) NOT NULL,
  hourly_rate VARCHAR2(20) NOT NULL,
  is_active   VARCHAR2(20) NOT NULL
);




-- STEP: 38.null



ALTER TABLE MEMBER
  ADD CONSTRAINT MEMBER_email_UN UNIQUE (email);




-- STEP: 39.null



ALTER TABLE MEMBER
  ADD CONSTRAINT MEMBER_PLAN_FK FOREIGN KEY (PLAN_plan_id)
  REFERENCES PLAN (plan_id);




-- STEP: 40.null



ALTER TABLE MEMBER
  ADD CONSTRAINT MEMBER_PK PRIMARY KEY (member_id);




-- STEP: 41.null



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




-- STEP: 42.null



ALTER TABLE PLAN
  ADD CONSTRAINT PLAN_PK PRIMARY KEY (plan_id);




-- STEP: 43.null



ALTER TABLE PLAN
  ADD CONSTRAINT PLAN_plan_name_UN UNIQUE (plan_name);




-- STEP: 44.null



CREATE TABLE PLAN
(
  plan_id                VARCHAR2(10) NOT NULL,
  plan_name              VARCHAR2(10) NOT NULL,
  monthly_fee            VARCHAR2(12) NOT NULL,
  max_monthly_room_hours VARCHAR2(12) NOT NULL
);




-- STEP: 45.null



BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE plan';
EXCEPTION WHEN OTHERS THEN NULL;
END;




-- STEP: 46.null



BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE member';
EXCEPTION WHEN OTHERS THEN NULL;
END;




-- STEP: 47.null



BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE booking';
EXCEPTION WHEN OTHERS THEN NULL;
END;




-- STEP: 48.null



BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE room';
EXCEPTION WHEN OTHERS THEN NULL;
END;




-- STEP: 49.null



BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE payment';
EXCEPTION WHEN OTHERS THEN NULL;
END;




-- STEP: 50.null



BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE access_log';
EXCEPTION WHEN OTHERS THEN NULL;
END;




-- STEP: 51.null



ALTER TABLE MEMBER 
    ADD CONSTRAINT MEMBER_PLAN_FK FOREIGN KEY 
    ( 
     PLAN_plan_id
    ) 
    REFERENCES PLAN 
    ( 
     plan_id
    );




-- STEP: 52.null



ALTER TABLE BOOKING 
    ADD CONSTRAINT BOOKING_ROOM_FK FOREIGN KEY 
    ( 
     ROOM_room_id
    ) 
    REFERENCES ROOM 
    ( 
     room_id
    );




-- STEP: 53.null



ALTER TABLE ACCESS_LOG 
    ADD CONSTRAINT ACCESS_LOG_MEMBER_FK FOREIGN KEY 
    ( 
     MEMBER_member_id
    ) 
    REFERENCES MEMBER 
    ( 
     member_id
    );




-- STEP: 54.null



ALTER TABLE BOOKING 
    ADD CONSTRAINT BOOKING_MEMBER_FK FOREIGN KEY 
    ( 
     MEMBER_member_id
    ) 
    REFERENCES MEMBER 
    ( 
     member_id
    );




-- STEP: 55.null



CREATE TABLE ROOM 
    ( 
     room_id     VARCHAR2 (20)  NOT NULL , 
     room_name   VARCHAR2 (20)  NOT NULL , 
     room_type   VARCHAR2 (20)  NOT NULL , 
     capacity    VARCHAR2 (20)  NOT NULL , 
     hourly_rate VARCHAR2 (20)  NOT NULL , 
     is_active   VARCHAR2 (20)  NOT NULL 
    );




-- STEP: 56.null



ALTER TABLE ROOM 
    ADD CONSTRAINT ROOM_room_name_UN UNIQUE ( room_name );




-- STEP: 57.null



ALTER TABLE ROOM 
    ADD CONSTRAINT ROOM_PK PRIMARY KEY ( room_id );




-- STEP: 58.null



ALTER TABLE PLAN 
    ADD CONSTRAINT PLAN_PK PRIMARY KEY ( plan_id );




-- STEP: 59.null



CREATE TABLE PLAN 
    ( 
     plan_id                VARCHAR2 (10)  NOT NULL , 
     plan_name              VARCHAR2 (10)  NOT NULL , 
     monthly_fee            VARCHAR2 (12)  NOT NULL , 
     max_monthly_room_hours VARCHAR2 (12)  NOT NULL 
    );




-- STEP: 60.null



ALTER TABLE PLAN 
    ADD CONSTRAINT PLAN_plan_name_UN UNIQUE ( plan_name );




-- STEP: 61.null



ALTER TABLE MEMBER 
    ADD CONSTRAINT MEMBER_email_UN UNIQUE ( email );




-- STEP: 62.null



ALTER TABLE MEMBER 
    ADD CONSTRAINT MEMBER_PK PRIMARY KEY ( member_id );




-- STEP: 63.null



ALTER TABLE BOOKING 
    ADD CONSTRAINT BOOKING_PK PRIMARY KEY ( booking_id );




-- STEP: 64.null



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
    );




-- STEP: 65.null



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
    );




-- STEP: 66.null



ALTER TABLE ACCESS_LOG 
    ADD CONSTRAINT ACCESS_LOG_PK PRIMARY KEY ( access_id );




-- STEP: 67.null



CREATE TABLE ACCESS_LOG 
    ( 
     access_id        VARCHAR2 (10)  NOT NULL , 
     member_id        VARCHAR2 (10)  NOT NULL , 
     booking_id       VARCHAR2 (10)  NOT NULL , 
     access_time      TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     access_result    VARCHAR2 (10)  NOT NULL , 
     door_location    VARCHAR2 (10)  NOT NULL , 
     MEMBER_member_id VARCHAR2 (20)  NOT NULL 
    );




