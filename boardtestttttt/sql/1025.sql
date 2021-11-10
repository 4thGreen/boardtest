INSERT INTO beige_board VALUES (
    1,
    'user',
    '공지',
    0,
    '공지입니다',
    '내용~',
    '2021-10-25',
    '0',
    0
);

INSERT INTO beige_board VALUES (
    2,
    'user2',
    '질문',
    0,
    '제목2222',
    '내용222222',
    '2021-10-25',
    '0',
    0
);

INSERT INTO beige_board VALUES (
    3,
    'user3',
    '질문',
    0,
    '제목333333',
    '내용3333333333',
    '2021-10-25',
    '0',
    0
);
INSERT INTO beige_board VALUES (
    4,
    'user4',
    '공지',
    0,
    '공지 제목 44444',
    '내용444444444444444',
    '2021-10-25',
    '0',
    0
);

DROP TABLE beige_board;

CREATE TABLE beige_board (
    b_id       NUMBER(10) NOT NULL,
    m_id       VARCHAR2(15) NOT NULL,
    b_category VARCHAR2(10) NOT NULL,
    b_view     NUMBER(10) DEFAULT 0 NOT NULL,
    b_title    VARCHAR2(30) NOT NULL,
    b_content  VARCHAR2(3000) NOT NULL,
    b_date     DATE NOT NULL,
    b_secret   CHAR(1) NOT NULL,
    b_ref      NUMBER(10) NOT NULL
);

SELECT
    *
FROM
    beige_board;
    
    commit;