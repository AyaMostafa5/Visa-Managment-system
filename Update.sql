--create proc for deposit 
create proc Deposit(@amount float,@client_Email varchar(255))
as
begin
begin try
update [dbo].[Account] 
set [Amount]=[Amount]+@amount
where [client_Email]=@client_Email
print('amount is added successfully');
end try
begin catch
print('try again')
end catch
end

--create proc for WithDraw 
go
create proc WithDraw (@amount float,@client_Email varchar(255))
as
begin
begin try
update [dbo].[Account] 
set [Amount]=[Amount]-@amount
where [client_Email]=@client_Email
print('amount is withdrawed successfully');
end try
begin catch
print('try again')
end catch
end


--create proc for transfer money 
go
create proc transfer_money(@amount float,@client_Email_sender varchar(255),@client_Email_recevier varchar(255))
as
begin
begin try
declare @amount_existed float ;
select @amount_existed =[Amount] from [dbo].[Account] where[client_Email]=@client_Email_sender
if(@amount<@amount_existed)
begin
update [dbo].[Account] 
set [Amount]=[Amount]-@amount
where [client_Email]=@client_Email_sender

update [dbo].[Account] 
set [Amount]=[Amount]+@amount
where [client_Email]=@client_Email_recevier
print('amount is transfered successfully');
end
else
begin
print('your amount is not sufficient to transfer ');
end
end try
begin catch
print('try again')
end catch
end

--create proc to delet account
go
 create proc Delete_account(@client_Email varchar(255))
 as
 begin
 begin try
 delete from [dbo].[Client] where [Email]=@client_Email
 delete from [dbo].[Account] where [client_Email]=@client_Email
 print('your account deleted successfully');
 end try

 begin catch
  print('try again');
 end catch
 end