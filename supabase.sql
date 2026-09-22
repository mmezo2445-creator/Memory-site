-- شغّل هذا الجزء مرة واحدة داخل Supabase > SQL Editor
-- لا تحذف الأعمدة القديمة؛ التعديل ده يضيف بيانات العلاقة وألبوم الصور.

alter table public.memories
add column if not exists relationship_start date,
add column if not exists first_meeting date,
add column if not exists photo_urls text[];

-- اختياري: تأكد إن الجدول والـ bucket موجودين من الإعداد القديم.
create table if not exists public.memories (
  id uuid primary key,
  name text not null,
  birthday date not null,
  message text,
  photo_url text,
  created_at timestamptz not null default now()
);

insert into storage.buckets (id, name, public)
values ('memory-images', 'memory-images', true)
on conflict (id) do nothing;
