-- box_qty 제거 (2026-07 정리)
-- 유래: '박스당 입수량 자동계산'(커밋 058aeb8) 시도 때 추가했으나,
--       '창고별 박스 수 수동 입력'(커밋 5c7ab27)으로 방식을 바꾸면서 폐기됨.
--       현재 코드(index.html)는 box_qty 를 읽지도 쓰지도 않는 고아 컬럼.
-- 목적: 라이브 DB 와 supabase_schema.sql 을 일치시켜, 스키마 정본을 코드로 재현 가능하게.
-- 안전: 사용처 0. 데이터 손실 영향 없음(값이 화면·로직 어디에도 안 쓰임).
alter table public.pkg_items drop column if exists box_qty;
