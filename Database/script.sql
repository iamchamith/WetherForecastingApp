USE [WeatherForecasting]
GO
/****** Object:  Table [dbo].[Forecast]    Script Date: 5/2/2021 3:27:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forecast](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ForecastDate] [date] NULL,
	[WeatherType] [varchar](50) NULL,
	[MinTemp] [decimal](18, 0) NULL,
	[MaxTemp] [decimal](18, 0) NULL,
	[LocationId] [int] NULL,
 CONSTRAINT [PK_Forecast] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/2/2021 3:27:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Forecast] ON 

INSERT [dbo].[Forecast] ([Id], [ForecastDate], [WeatherType], [MinTemp], [MaxTemp], [LocationId]) VALUES (1, CAST(N'2021-05-02' AS Date), N'cloudy', CAST(15 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 1)
INSERT [dbo].[Forecast] ([Id], [ForecastDate], [WeatherType], [MinTemp], [MaxTemp], [LocationId]) VALUES (2, CAST(N'2021-05-03' AS Date), N'sunny', CAST(18 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 1)
INSERT [dbo].[Forecast] ([Id], [ForecastDate], [WeatherType], [MinTemp], [MaxTemp], [LocationId]) VALUES (3, CAST(N'2021-05-02' AS Date), N'cloudy', CAST(15 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 2)
INSERT [dbo].[Forecast] ([Id], [ForecastDate], [WeatherType], [MinTemp], [MaxTemp], [LocationId]) VALUES (4, CAST(N'2021-05-03' AS Date), N'sunny', CAST(11 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 2)
INSERT [dbo].[Forecast] ([Id], [ForecastDate], [WeatherType], [MinTemp], [MaxTemp], [LocationId]) VALUES (5, CAST(N'2021-05-02' AS Date), N'cloudy', CAST(15 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 3)
SET IDENTITY_INSERT [dbo].[Forecast] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [Name]) VALUES (1, N'Sydney')
INSERT [dbo].[Locations] ([Id], [Name]) VALUES (2, N'Melbone')
INSERT [dbo].[Locations] ([Id], [Name]) VALUES (3, N'Perth')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
ALTER TABLE [dbo].[Forecast]  WITH CHECK ADD  CONSTRAINT [FK_Forecast_Forecast] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[Forecast] CHECK CONSTRAINT [FK_Forecast_Forecast]
GO
