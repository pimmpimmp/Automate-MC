SET SQL_SAFE_UPDATES = 0;
delete from application.Mcapp where userId = (select uid from userlb.Userlb where email = 'reviewer1.mc@gmail.com');
delete from submission.EvidenceTaskSubmission where user_id = (select uid from userlb.Userlb where email = 'reviewer1.mc@gmail.com');
delete from submission.EvidenceSubmission where user_id = (select uid from userlb.Userlb where email = 'reviewer1.mc@gmail.com') and mc_id = 'fe093f40-27e0-4583-9ce7-39477f62a4df' and submitted = 1;
