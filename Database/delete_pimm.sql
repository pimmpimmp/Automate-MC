SET SQL_SAFE_UPDATES = 0;
delete from application.Mcapp where userId = (select uId from user.Userlb where email = 'jarinya.pimm2@gmail.com');
delete from submission.EvidenceTaskSubmission where user_Id = (select uId from user.Userlb where email = 'jarinya.pimm2@gmail.com');
delete from submission.EvidenceSubmission where user_Id = (select uId from user.Userlb where email = 'jarinya.pimm2@gmail.com') and mc_id = 'fe093f40-27e0-4583-9ce7-39477f62a4df' and submitted = 1;
