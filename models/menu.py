# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

#########################################################################
## Customize your APP title, subtitle and menus here
#########################################################################

response.logo = A(B('My','Music'),XML('&trade;&nbsp;'),
                  _class="brand",_href="http://localhost:8000/mymusic")
response.title ="My Music"
response.subtitle = 'Upload, Listen and Share Music & Audio Files'

## read more at http://dev.w3.org/html5/markup/meta.name.html
response.meta.author = 'Kunal Khaware <you@example.com>'
response.meta.keywords = 'Upload and Share Music & Audio Files'
response.meta.generator = 'Share Music'

## your http://google.com/analytics id
response.google_analytics_id = None

#########################################################################
## this is the main application menu add/remove items as required
#########################################################################

response.menu = [
    (T('Home'), False, URL('default', 'home'), []),
    (T('Music'), False, URL('default', 'music'), []),
    (T('People'), False, URL('default', 'people'), []),
    (T('Upload'), False, URL('default', 'upload'), []),


]
DEVELOPMENT_MENU = True



