
UPDATE `results`
SET status = "Submitted Data"
WHERE id IN (
        SELECT results_tmp.id
        FROM (SELECT * FROM results) AS results_tmp, events
        WHERE results.status = "Success"
                AND events.message="Submitted Data"
                AND results_tmp.email = events.email
                AND results_tmp.campaign_id = events.campaign_id);

UPDATE `results`
SET status = "Clicked Link"
WHERE id IN (
        SELECT results_tmp.id
        FROM (SELECT * FROM results) as results_tmp, events
        WHERE results_tmp.status = "Success"
                AND events.message="Clicked Link"
                AND results_tmp.email = events.email
                AND results_tmp.campaign_id = events.campaign_id);


