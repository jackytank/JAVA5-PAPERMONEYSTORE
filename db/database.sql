/****** Object:  Table [dbo].[Accounts]    Script Date: 6/20/2022 1:31:10 AM ******/
CREATE DATABASE [java5-assm]
GO
USE [java5-assm]
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](255) NULL,
	[admin] [bit] NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[activated] [bit] NOT NULL,
	[verifycode] [nvarchar](100) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/20/2022 1:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 6/20/2022 1:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/20/2022 1:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/20/2022 1:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createdate] [date] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/20/2022 1:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[available] [bit] NOT NULL,
	[createdate] [date] NOT NULL,
	[categoryid] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 6/20/2022 1:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[category] [nvarchar](50) NOT NULL,
	[sum] [float] NOT NULL,
	[count] [bigint] NOT NULL,
 CONSTRAINT [PK_NewTable] PRIMARY KEY CLUSTERED 
(
	[category] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'batman', N'tritmps15506@fpt.edu.vn', N'$2a$12$ur8.mOF9j6fbVKAbn.LBie1pR8OFdIioEnI00pOZzuyMTCi.nHMUK', N'0323232323', N'No 30 Gotham City', 1, N'batman.jpg', 1, N'0')
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'biden', N'biden@biden.biden', N'$2a$12$rgs1WOsGw8ABmaJLcGFzHuEjlspJFbDRGE5T5NFHvpQWtvVxKts56', N'1231231231', N'123123123', 0, N'biden.jpg', 1, N'0')
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'flash', N'flash@gmail.com', N'$2a$12$vQoH1N95zkXC.WeoGn2uYu4k9wSJEuXRr9EOejQIyXRj0sXGoLGze', N'0123456789', N'hcmc', 0, N'flash.jpg', 1, N'0')
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'incredible', N'tritmps15506@fpt.edu.vn', N'$2a$12$fAzSGQjPYYh9ZyZ..KZQCOPD0oUITg9.zoqmb8GKzxDreCMAoAC.q', N'1231231231', N'asdasdasdasd', 0, N'biden.jpg', 1, N'0')
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'superman', N'superman@gmailcom', N'$2a$12$49pM8vVYgWe5e6OZA0h90eC0AM3XKxC/f7P5fec49pkj973nfnb/O', N'0495959951', N'No 10 Gotham City', 0, N'superman.jpg', 1, N'0')
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'trung1', N'tritmps15506@fpt.edu.vn', N'$2a$12$cG5mtARbqC2DxxLb8AzYpedyv7VdVyfve.xywP.fG.pwlRlNQY.xe', N'1231231231', N'123123123', 0, N'biden.jpg', 1, N'0')
INSERT [dbo].[Accounts] ([username], [email], [password], [phone], [address], [admin], [image], [activated], [verifycode]) VALUES (N'trung12', N'tritmps15506@fpt.edu.vn', N'$2a$12$A0PVTrUUMxrARakMcYIHBOGXXCWrMMnAATyXP60W1KzT8BEZ..jQW', N'1231231231', N'123123123', 0, N'biden.jpg', 0, N'cCwsjKNiTJfmQNMs5xgc5n1Ht5BdYO4RHfS9FFvjdNKnVuk8LJSfMGnA7X8UThT3')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'C01', N'money')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'C02', N'coin')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [price], [quantity], [orderid], [productid]) VALUES (2, 120000, 4, 22, 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [address], [createdate], [username]) VALUES (22, N'No 30 Gotham City', CAST(N'2022-04-05' AS Date), N'superman')
INSERT [dbo].[Orders] ([id], [address], [createdate], [username]) VALUES (23, N'No 30 Gotham City', CAST(N'2022-06-17' AS Date), N'batman')
INSERT [dbo].[Orders] ([id], [address], [createdate], [username]) VALUES (24, N'No 30 Gotham City', CAST(N'2022-06-17' AS Date), N'batman')
INSERT [dbo].[Orders] ([id], [address], [createdate], [username]) VALUES (25, N'No 30 Gotham City', CAST(N'2022-06-17' AS Date), N'batman')
INSERT [dbo].[Orders] ([id], [address], [createdate], [username]) VALUES (26, N'No 10 Gotham City', CAST(N'2022-06-18' AS Date), N'superman')
INSERT [dbo].[Orders] ([id], [address], [createdate], [username]) VALUES (27, N'No 10 Gotham City', CAST(N'2022-06-18' AS Date), N'superman')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [price], [image], [available], [createdate], [categoryid]) VALUES (2, N'Vietnamdong 20k Banknotes', 10, N'20k.jpg', 1, CAST(N'2021-02-02' AS Date), N'C01')
INSERT [dbo].[Products] ([id], [name], [price], [image], [available], [createdate], [categoryid]) VALUES (3, N'Vietnamdong 10k Banknotes', 5, N'10k.jpg', 1, CAST(N'2022-01-01' AS Date), N'C01')
INSERT [dbo].[Products] ([id], [name], [price], [image], [available], [createdate], [categoryid]) VALUES (4, N'Vietnamdong 5k Banknotes', 2.5, N'5k.jpg', 1, CAST(N'2020-01-03' AS Date), N'C01')
INSERT [dbo].[Products] ([id], [name], [price], [image], [available], [createdate], [categoryid]) VALUES (5, N'Vietnamdong 2k Banknotes', 7, N'2k.jpg', 1, CAST(N'2019-03-02' AS Date), N'C01')
INSERT [dbo].[Products] ([id], [name], [price], [image], [available], [createdate], [categoryid]) VALUES (6, N'Vietnamdong 1k Banknotes', 12, N'1k.jpg', 1, CAST(N'2015-03-08' AS Date), N'C01')
INSERT [dbo].[Products] ([id], [name], [price], [image], [available], [createdate], [categoryid]) VALUES (7, N'Vietnamdong 500 Banknotes', 10, N'500vnd.jpg', 1, CAST(N'2019-03-03' AS Date), N'C01')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ('0') FOR [verifycode]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK3w63vi3bk795mlimkws8fvuin] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK3w63vi3bk795mlimkws8fvuin]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKh35b1ljeu4440iie9psw8a7yt] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKh35b1ljeu4440iie9psw8a7yt]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_1] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_3] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_3]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FKam85breqbk4xym48p8hiash2g] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FKam85breqbk4xym48p8hiash2g]
GO
