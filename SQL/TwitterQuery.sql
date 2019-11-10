create database Twitter
go
use Twitter
go


create table Usuario
(
	IdUsuario int primary key identity(1,1),
	Nombre nvarchar (max),
	Apellido nvarchar(max),
	NombreUser nvarchar(max),
	Correo nvarchar(max),
	Contraseña nvarchar(max),
	Genero nvarchar(max),
	Nacimiento datetime
);
go

create table Followers
(
	IdFollower int primary key identity(1,1),
	IdFollower1 int,
	IdFollower2 int
);

create table Post
(
	IdPost int primary key identity(1,1),
	IdUser int,
	Likes int,
	Comentarios nvarchar(max),
	Mensaje nvarchar(max)
);

create table ImagePost
(
	IdImagePost int primary key identity(1,1),
	IdUser int,
	Imagen nvarchar(max),
	Likes int,
	Comentarios nvarchar(max),
	Mensaje nvarchar(max)
);

create table Comment
(
	IdComentario int primary key identity(1,1),
	IdUsuarios int,
	Mensaje nvarchar(max)
);

--Procedimientos Usuarios

create procedure crearUsuario
(
	@Nombre nvarchar (max),
	@Apellido nvarchar(max),
	@NombreUser nvarchar(max),
	@Correo nvarchar(max),
	@Contraseña nvarchar(max),
	@Genero nvarchar(max),
	@Nacimiento datetime,
	@haserror bit out
)
as
begin try
	set @haserror = 0;
	insert into Usuario
	values
	(@Nombre, @Apellido, @NombreUser, @Correo, @Contraseña, @Genero, @Nacimiento)
end try
begin catch
	set @haserror = 1;
end catch
go

create procedure eliminarUsuario
(
	@IdUser int,
	@haserror bit out
)
as
set @haserror = 1;
begin try
if exists(select top 1 1 from Usuario where IdUsuario = @IdUser)
begin
	set @haserror = 0
	delete users where IdUsuario = @IdUser
end
end try
begin catch
	set @haserror = 1;
end catch
go

create procedure getUsuarios
as
select * from Usuario
go

create procedure agregarFollower
(
	@idFollower1 int,
	@idFollower2 int,
	@haserror bit out
)
as
begin try
	set @haserror = 0;
	insert into Followers(IdFollower1, IdFollower2)
	values(@idFollower1, @idFollower2)
end try
begin catch
	set @haserror = 1;
end catch
go

create procedure eliminarFollower
(
	@idFollower1 int,
	@idFollower2 int,
	@haserror bit out
)
as
set @haserror = 1;
begin try
	if exists(select top 1 1 from Followers where IdFollower1 = @idFollower1 and IdFollower2 = @idFollower2)
	begin
	set @haserror = 0
	delete Followers where IdFollower1 = @idFollower1 and IdFollower2 = @idFollower2
	end
end try
begin catch
	set @haserror = 1;
end catch
go

--Posts
create procedure addImagePost
(
	@idUser int,
	@mensaje nvarchar(max),
	@imagen nvarchar(max),
	@likes int,
	@comentarios int,
	@haserror bit out
)
as
begin try
	set @haserror = 0;
	insert into ImagePost(IdUser, Mensaje, Imagen, Likes, Comentarios)
	values(@idUser, @mensaje, @imagen, 0, @comentarios)
end try
begin catch
	set @haserror = 1;
end catch
go

create procedure addPost
(
	@idUser int,
	@mensaje nvarchar(max),
	@likes int,
	@comentarios int,
	@haserror bit out
)
as
begin try
	set @haserror = 0;
	insert into Post(IdUser, Mensaje, Likes, Comentarios)
	values(@idUser,@mensaje, 0, @comentarios)
end try
begin catch
	set @haserror = 1;
end catch
go

create procedure getPosts
(
	@idUser int,
	@hasherror bit out
)
as
begin try
	select _user.Nombre, _user.Apellido, post.Mensaje, post.likes, post.Comentarios
	from Users _user, Post post
	where _user.IdUsuario = @idUser
end try
begin catch
	set @hasherror = 1;
end catch
go