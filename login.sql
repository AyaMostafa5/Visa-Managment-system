use [BankSystemManagment];
--go
--create proc Sp_login(@userName nvarchar(20),@pass nvarchar(10))
--as
--begin
--begin try
--if exists(select [userName] from [dbo].[Client] where [userName]=@userName)
--begin 
--declare @Realpass nvarchar(10);
--select @Realpass=[pass_word] from [dbo].[Client] where [userName]=@userName
--if(@pass= @Realpass)
--begin

--end

--end
--end try

--begin catch

--end catch
--end

