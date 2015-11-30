# -*- coding: UTF-8 -*-
__author__ = 'sungwoo'

import MySQLdb
import itertools
import datetime
import json

db = MySQLdb.connect('localhost', 'root', 'root', 'redmine', charset='utf8')
cursor = db.cursor()

def dictfetchall(cursor):
    """Returns all rows from a cursor as a list of dicts"""
    desc = cursor.description
    return [dict(itertools.izip([col[0] for col in desc], row))
            for row in cursor.fetchall()]

def get_tracker_ids(project_id):
    cursor.execute('SELECT t.id FROM trackers t, projects_trackers pt WHERE pt.project_id = %s AND pt.tracker_id = t.id' % project_id)
    return cursor.fetchall()


def get_tracker_issues(project_id, tracker_id):
    cursor.execute('SELECT * FROM issues i WHERE i.project_id = %s AND i.tracker_id = %s' % (project_id, tracker_id))
    issues = dictfetchall(cursor)
    for issue in issues:
        for key in issue:
            if isinstance(issue[key], long):
                issue[key] = int(issue[key])
            elif isinstance(issue[key], (datetime.datetime, datetime.date)):
                issue[key] = str(issue[key])
            # elif isinstance(issue[key], (unicode)):
            #     issue[key] = issue[key]
        print issue

    # cursor.execute('SELECT cft.custom_field_id FROM custom_fields_trackers cft WHERE cft.tracker_id = %s' % tracker_id)
    # for custom_field_id in cursor.fetchall():
    #     cursor.execute('SELECT cf.id, cf.position, cf.name, cf.default_value FROM custom_fields cf WHERE cf.id = %s' % custom_field_id)
    #     (cf_id, cf_postion, cf_name, cf_default_value) = cursor.fetchone()

s_project_id = 1014

for tracker_id, in get_tracker_ids(s_project_id):
    print 'tracker id: %s' % tracker_id
    get_tracker_issues(s_project_id, tracker_id)
    break

db.close()