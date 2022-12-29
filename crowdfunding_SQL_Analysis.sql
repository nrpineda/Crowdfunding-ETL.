-- Challenge 


-- 1.Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cpg.backers_count, cpg.cf_id, cpg.outcome
FROM campaign as cpg
WHERE (cpg.outcome = 'live')
ORDER BY cpg.backers_count DESC;

-- 2.Using the "backers" table confirm the results in the first query.

SELECT COUNT (bkr.cf_id), bkr.cf_id
FROM backers as bkr
GROUP BY bkr.cf_id
ORDER BY COUNT(bkr.cf_id) DESC;

-- 3.Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT con.first_name, con.last_name, con.email, (cpg.goal - cpg.pledged) as remaining_goal_amount 
INTO email_contacts_remaining_goal_amount
FROM campaign as cpg
INNER JOIN contacts as con
ON (cpg.contact_id = con.contact_id)
WHERE (cpg.outcome = 'live')
ORDER BY remaining_goal_amount DESC;

SELECT * FROM email_contacts_remaining_goal_amount;

-- 4.Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT bck.email, bck.first_name, bck.last_name, cpg.cf_id, cpg.company_name, cpg.description, cpg.end_date, (cpg.goal - cpg.pledged) as left_of_goal 
INTO email_backers_remaining_goal_amount
FROM campaign as cpg
INNER JOIN backers as bck
ON (cpg.cf_id = bck.cf_id)
WHERE (cpg.outcome = 'live')
ORDER BY bck.last_name, bck.email;

SELECT * FROM email_backers_remaining_goal_amount;