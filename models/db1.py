# -*- coding: utf-8 -*-
# -*- coding: utf-8 -*-

db.define_table('t_music_category',
    Field('id','integer'),
    Field('cat_name','string'),
    Field('cat_desc','text'),
    migrate=False)

#--------
db.define_table('t_upload_share_likes',
    Field('id','integer'),
    Field('upload_id','integer'),
    Field('count_likes','integer'),
    Field('count_shares','integer'),
    migrate=False)

#--------
db.define_table('t_uploads',
    Field('id','integer'),
    Field('user_id','integer'),
    Field('music_category_id','integer'),
    Field('artists','text'),
    Field('upload_datetime','datetime'),
    Field('file_url','string'),
    Field('track_desc','text'),
    migrate=False)

#--------
db.define_table('t_users',
    Field('id','integer'),
    Field('first_name','string'),
    Field('middle_name','string'),
    Field('last_name','string'),
    Field('email','string'),
    Field('city','string'),
    Field('country','string'),
    Field('date_joined','datetime'),
    Field('is_account_active','integer'),
    migrate=False)

#--------
db.define_table('t_users_account',
    Field('id','integer'),
    Field('username','string'),
    Field('password','string'),
    Field('user_id','integer'),
    migrate=False)

#--------
db.define_table('t_users_music_taste',
    Field('id','integer'),
    Field('user_id','integer'),
    Field('music_category_id','integer'),
    Field('artists','text'),
    migrate=False)

#--------
db.define_table('t_users_profile_pic',
    Field('id','integer'),
    Field('user_id','integer'),
    Field('profile_pic_url','text'),
    migrate=False)

