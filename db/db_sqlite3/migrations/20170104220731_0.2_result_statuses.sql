

UPDATE results 
SET status = "Submitted Data" 
WHERE id IN (
	SELECT results.id
	FROM results, events
	WHERE results.status = "Success"
		AND events.message="Submitted Data"
		AND results.email = events.email
		AND results.campaign_id = events.campaign_id);
		
UPDATE results 
SET status = "Clicked Link" 
WHERE id IN (
	SELECT results.id
	FROM results, events
	WHERE results.status = "Success"
		AND events.message="Clicked Link"
		AND results.email = events.email
		AND results.campaign_id = events.campaign_id);



