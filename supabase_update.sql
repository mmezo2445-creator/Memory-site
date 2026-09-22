alter table public.memories
add column if not exists password_hash text,
add column if not exists final_message text,
add column if not exists photo_captions text[];
