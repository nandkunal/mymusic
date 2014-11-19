# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

#########################################################################
## This is a sample controller
## - index is the default action of any application
## - user is required for authentication and authorization
## - download is for downloading files uploaded in the db (does streaming)
## - api is an example of Hypermedia API support and access control
#########################################################################

def index():
    """
    example action using the internationalization operator T and flash
    rendered by views/default/index.html or views/generic.html

    if you need a simple wiki simply replace the two lines below with:
    return auth.wiki()
    """
    response.flash = T("Welcome to My Music!")
    #return dict(form=SQLFORM.factory(Field('name')).process())
    return dict()
@auth.requires_login()
def home():
    response.flash = T("Welcome to My Music!")
    query = (db.t_uploads.user_id==session['auth']['user']['id'])
    grid = SQLFORM.grid(query,editable=False)
    return dict(grid=grid)

    #return locals()
@auth.requires_login()
def upload():

  form  = SQLFORM.factory(
    Field('Music Category','string',requires=IS_IN_DB(db,db.t_music_category.id,'%(cat_name)s',zero=T('Select'))),
    Field('Artist','text',requires=IS_NOT_EMPTY()),
    Field('Timestamp','datetime'),
    Field('Audio File','upload',uploadfolder='uploads'),
    Field('Description','text')

  )
  if form.validate():
      form.vars.user_id= session['auth']['user']['id']
      db.t_uploads.insert(user_id=form.vars['user_id'],music_category_id=form.vars['Music Category'],artists=form.vars['Artist'],upload_datetime=form.vars['Timestamp'],file_url=form.vars['Audio File'],track_desc=form.vars['Description'])
      response.flash = T("File Uploaded Sucessfully")
  return dict(form=form)
@auth.requires_login()
def music():
    query = (db.t_uploads)
    grid = SQLFORM.grid(query,editable=False)
    return dict(grid=grid)



@auth.requires_login()
def people():

    query = (db.auth_user)
    grid = SQLFORM.grid(query,editable=False)
    return dict(grid=grid)
def user():
    """
    exposes:
    http://..../[app]/default/user/login
    http://..../[app]/default/user/logout
    http://..../[app]/default/user/register
    http://..../[app]/default/user/profile
    http://..../[app]/default/user/retrieve_password
    http://..../[app]/default/user/change_password
    http://..../[app]/default/user/manage_users (requires membership in
    use @auth.requires_login()
        @auth.requires_membership('group name')
        @auth.requires_permission('read','table name',record_id)
    to decorate functions that need access control
    """
    return dict(form=auth())


@cache.action()
def download():
    """
    allows downloading of uploaded files
    http://..../[app]/default/download/[filename]
    """
    return response.download(request, db)


def call():
    """
    exposes services. for example:
    http://..../[app]/default/call/jsonrpc
    decorate with @services.jsonrpc the functions to expose
    supports xml, json, xmlrpc, jsonrpc, amfrpc, rss, csv
    """
    return service()


@auth.requires_login() 
def api():
    """
    this is example of API with access control
    WEB2PY provides Hypermedia API (Collection+JSON) Experimental
    """
    from gluon.contrib.hypermedia import Collection
    rules = {
        '<tablename>': {'GET':{},'POST':{},'PUT':{},'DELETE':{}},
        }
    return Collection(db).process(request,response,rules)
