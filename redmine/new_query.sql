use redmine;
set names utf8;
SET SESSION group_concat_max_len = 5000000;
SET @projectId := 1014;
SET @redmineHost := 'http://svn.humaxdigital.com:3000';

SELECT t.id FROM trackers t, projects_trackers pt WHERE pt.project_id = @projectId AND pt.tracker_id = t.id;

SELECT * FROM issues WHERE issues.project_id = 1014 AND issues.tracker_id = 4;

SELECT custom_fields_trackers.custom_field_id FROM custom_fields_trackers WHERE custom_fields_trackers.tracker_id = 4;

SELECT * FROM custom_values cv WHERE cv.customized_id = 102273;


SELECT DISTINCT cft.custom_field_id FROM tmp_target_trackers LEFT JOIN custom_fields_trackers cft on tmp_target_trackers.id = cft.tracker_id;

CREATE TEMPORARY TABLE tmp_custom_fields SELECT DISTINCT cft.custom_field_id FROM tmp_target_trackers LEFT JOIN custom_fields_trackers cft on tmp_target_trackers.id = cft.tracker_id;

SELECT * FROM tmp_custom_fields;

SELECT cf.id, cf.name, COUNT(*) FROM custom_fields cf, tmp_custom_fields, custom_values cv WHERE cf.id = tmp_custom_fields.custom_field_id and cf.id = cv.custom_field_id GROUP BY cf.id;



SELECT * FROM custom_fields_trackers cft, custom_fields cf, tmp_target_trackers WHERE cft.custom_field_id = custom_field_id AND cft.tracker_id IN (tmp_target_trackers.id);

SELECT @customFieldName := group_concat(CONCAT('\'',cf.name,'\'') separator ',') AS customFieldName
FROM (SELECT DISTINCT cd.id, cd.name, (SELECT COUNT(*) FROM custom_values WHERE custom_values.custom_field_id = cd.id and value != '')
      FROM custom_fields AS cd
        LEFT JOIN custom_fields_trackers ct
          ON cd.id = ct.custom_field_id
      WHERE (SELECT COUNT(*) FROM custom_values WHERE custom_values.custom_field_id = cd.id AND value != '') > 0 AND ct.tracker_id IN (SELECT t.tracker_id FROM projects_trackers t WHERE t.project_id = @projectId)
     ) cf
ORDER BY cf.id ASC;

select @customFieldName;

SELECT @customFieldFunction := group_concat(CONCAT(' GetCustomValueFromString(giatri.manphep, ',cf.id,') as \'',cf.name,'\' ') separator ' , ') AS customFieldName
FROM (SELECT DISTINCT cd.id, cd.name
      FROM custom_fields AS cd
        LEFT JOIN custom_fields_projects cfp
          ON cd.id = cfp.custom_field_id
      WHERE (SELECT COUNT(*) FROM custom_values WHERE custom_values.custom_field_id = cd.id AND value != '') > 0 AND (cfp.project_id = @projectId OR cd.is_for_all = 1)
     ) cf
ORDER BY cf.id ASC;

set names utf8;
SELECT CONVERT(@customFieldFunction using utf8);

SET @allquery := CONCAT("
(SELECT
    i.id AS '#',
    `is`.name AS 'Status',
    p.name AS 'Project',
    pt.name AS 'Tracker',
    e.name AS 'Priority',
    i.`subject` AS 'Subject',
    CONCAT(IFNULL(CONVERT(u_as.firstname using utf8), ''), ' ', IFNULL(CONVERT(u_as.lastname using utf8), '')) AS 'Assigned to',
    IFNULL(CONVERT(i.`category_id` using utf8), '') AS 'Category',
    IFNULL(CONVERT(`version`.name using utf8), '') AS 'Target version',
    CONVERT(CONCAT(u_au.lastname) using utf8) AS 'Author',
    CONVERT(i.start_date using utf8) AS 'Start Date',
    IFNULL(CONVERT(i.due_date using utf8), '') AS 'Due date',
    IFNULL(CONVERT(i.done_ratio using utf8), '') AS '% Done',
    IFNULL(CONVERT(i.estimated_hours using utf8), '') AS 'Estimated time',
    IFNULL(CONVERT(i.parent_id using utf8), '') AS 'Parent task',
    CONVERT(i.created_on using utf8) AS 'Created',
    CONVERT(i.updated_on using utf8) AS 'Updated',
    CONVERT(CONCAT('[', @redmineHost, '/issues/', i.id, ']') using utf8) AS 'Link',
    ",@customFieldFunction,",
    IFNULL(CONVERT(CONCAT('Description: ',
            i.`description`,
            '\n----------------------------------------------------------------------------\n',
            the_comments.comment) using utf8), '') AS 'Description'
FROM
    `redmine`.issues AS i
        LEFT JOIN
    `redmine`.issue_statuses AS `is` ON i.status_id = `is`.id
        LEFT JOIN
    `redmine`.versions AS `version` ON i.fixed_version_id = `version`.id
        LEFT JOIN
    `redmine`.projects AS `p` ON p.id = i.project_id
        LEFT JOIN
    `redmine`.trackers AS `pt` ON pt.id = i.tracker_id
        LEFT JOIN
    `redmine`.enumerations AS `e` ON e.id = i.priority_id
        LEFT JOIN
    `redmine`.users AS `u_au` ON u_au.id = i.author_id
        LEFT JOIN
    `redmine`.users AS `u_as` ON u_as.id = i.assigned_to_id
		LEFT JOIN
    (SELECT
        DISTINCT i.id AS 'user_comment_id',
            CONVERT(GROUP_CONCAT(CONCAT(u_note.created_on, ' ', u_note.login, ': ', REPLACE(`j`.`notes`, CHAR(10), '\n'))
                SEPARATOR '\n--------------------------------------\n') USING utf8) AS 'comment'
    FROM
        `redmine`.issues AS i
    LEFT JOIN `redmine`.issue_statuses AS `is` ON i.status_id = `is`.id
    LEFT JOIN `redmine`.projects AS `p` ON p.id = i.project_id
    LEFT JOIN `redmine`.`journals` AS `j` ON j.journalized_id = i.id
    LEFT JOIN `redmine`.users AS `u_note` ON u_note.id = j.user_id
    WHERE i.project_id = @projectId
    GROUP BY i.id
    ORDER BY j.created_on DESC) AS `the_comments` ON `the_comments`.user_comment_id = i.id
	LEFT JOIN (
		SELECT customized_id, CONVERT(GROUP_CONCAT(CONCAT(cv.custom_field_id,'||t#pt', value) separator '|@t#pt') using utf8) AS manphep
        FROM custom_values cv
		GROUP BY customized_id
        ORDER BY customized_id
    ) giatri ON giatri.customized_id = i.id
WHERE
    i.project_id = @projectId
ORDER BY i.created_on DESC
) ");

SELECT @allQuery;

PREPARE stmt FROM @allquery;
EXECUTE stmt;
