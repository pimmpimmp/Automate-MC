SET SQL_SAFE_UPDATES = 0;
delete from application.Mcapp where userId = (select uId from user.Userlb where email = 'earner.mc@gmail.com');
delete from submission.EvidenceTaskSubmission where user_Id = (select uId from user.Userlb where email = 'earner.mc@gmail.com');
delete from submission.EvidenceSubmission where user_Id = (select uId from user.Userlb where email = 'earner.mc@gmail.com') and mc_id = 'de594c8d-5d5b-4885-95d0-5425f727c74e' and submitted = 1;
