-- 사진 여러 장(photos) 컬럼 추가 — 이미 테이블이 있으면 SQL Editor 에 RUN (한 번만)
-- 기존 대표 사진(photo)은 앱에서 자동으로 photos 배열의 첫 장으로 인식됩니다.
alter table public.pkg_items add column if not exists photos jsonb default '[]';
