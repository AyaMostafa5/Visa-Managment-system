use[BankSystemManagment];
go
--insert into client table and creating account for him
create proc add_client(@first_name nvarchar(20),@Last_name nvarchar(20),@Age int ,@country nvarchar(20)
,@phone_number varchar(11),@pass_word nvarchar(10),@Email varchar(255),@VisaCardNumber int)
as
begin 
declare @amount float;
begin try
if exists(select [Amount] from [dbo].[Visa_card_Amount] where [visa_card_id]=@VisaCardNumber)
begin
insert into [dbo].[Client] values(@first_name,@Last_name,@Age,@country,@phone_number,@pass_word,@Email,@VisaCardNumber)
select  @amount =[Amount] from [dbo].[Visa_card_Amount] where [visa_card_id]=@VisaCardNumber
insert into [dbo].[Account]([account_id],[Amount],[client_Email])values(@VisaCardNumber,@amount,@Email)
print('Account created successfuly');
end

else
begin 
print('invalid visa_card number,try again');
end
end try

begin catch 
print('try again');
end catch
end

--creating proc for inserting into [dbo].[Contact_us]
go
create proc SP_contact_us(@message_contnent nvarchar(200))
as 
begin
begin try
declare @msg_id int;
select @msg_id =max([message_id]) from [dbo].[Contact_us]
if(@msg_id is null)
begin
set @msg_id=0
end
else
begin
set @msg_id=@msg_id+1;
end
insert into [dbo].[Contact_us] values(@msg_id,@message_contnent)
print('thanks for contacting us');
end try

begin catch
print('try again');
end catch

end

--creating proc for inserting data into [dbo].[Book_Ticket_Bill]
go
create proc Sp_Book_Ticket(@company_name varchar(20),@client_Email varchar(255),@Amount float)
as
begin
begin try
if(@Amount in (2000,3000,4000,5000))
begin
insert into [dbo].[Book_Ticket_Bill] values (@Amount,@client_Email,@company_name ,GETDATE())
print('you successfully booked the ticket');
end
else
begin
print('there is no ticket with this amount ,try again');
end
end try

begin catch
print('try again');
end catch
end

--creating proc for inserting data into [dbo].[Electricity_Water_Bill]

create proc Sp_Electricity_Water_Bill(@company_name varchar(20),@client_Email varchar(255),@Amount float)
as 
begin
begin try
insert into  [dbo].[Electricity_Water_Bill] values (@Amount,@client_Email,@company_name ,GETDATE())
print('you successfully paied the Bill');
end try
begin catch
print('try again');
end catch
end


--creating proc for inserting data into [dbo].[Internet_Bill]

create proc Sp_Internet_Bill(@company_name varchar(20),@client_Email varchar(255),@Amount float)
as 
begin
begin try
if(@Amount in (100,150,200,250))
begin
insert into [dbo].[Internet_Bill] values  (@Amount,@client_Email,@company_name ,GETDATE());
print('you successfully paied the Bill');
end
else
begin
print('there is internet Bill with this amount ,try again');
end
end try
begin catch
print('try again');
end catch
end

--creating proc for inserting data into [dbo].[Mobile_Recharge_Bill]

create proc Sp_Mobile_Recharge_Bill(@company_name varchar(20),@client_Email varchar(255),@Amount float)
as 
begin
begin try
if(@Amount in (100,150,200,250))
begin
insert into [dbo].[Mobile_Recharge_Bill] values  (@Amount,@client_Email,@company_name ,GETDATE());
print('you successfully paied the Bill');
end
else
begin
print('there is no Mobile_Recharge_Bill with this amount ,try again');
end
end try
begin catch
print('try again');
end catch
end