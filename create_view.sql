USE [PRICE]
GO

/****** Object:  View [dbo].[金_原油]    Script Date: 2017/11/19 15:34:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[金_原油]
AS
SELECT
		hk.*
	,	gsk3.権利行使価格 as 金_権利行使価格
	,	gsk3.始値 as 金_始値
	,	gsk3.安値 as 金_安値
	,	gsk3.高値 as 金_高値
	,	gsk3.終値 as 金_終値
	
	,	osk3.権利行使価格 as 石油_権利行使価格
	,	osk3.始値 as 石油_始値
	,	osk3.安値 as 石油_安値
	,	osk3.高値 as 石油_高値
	,	osk3.終値 as 石油_終値

FROM
	平均株価 as hk
inner join
	(
		select
			gsk2.*
		from
			商品価格 as gsk2
		inner join
			(
				select
						gsk1.日付
					,	min(gsk1.限月) as 限月
				from
					商品価格 as gsk1
				where
					gsk1.取引種別 = '11'
					and gsk1.商品 = '11'
					and gsk1.始値 is not null
				group by
					gsk1.日付
			) as tgsk
		on
			gsk2.日付 = tgsk.日付
			and gsk2.限月 = tgsk.限月
			and gsk2.取引種別 = '11'
			and gsk2.商品 = '11'
			and gsk2.始値 is not null
	) as gsk3
on
	hk.日付 = gsk3.日付
inner join
	(
		select
			osk2.*
		from
			商品価格 as osk2
		inner join
			(
				select
						osk1.日付
					,	min(osk1.限月) as 限月
				from
					商品価格 as osk1
				where
					osk1.取引種別 = '11'
					and osk1.商品 = '31'
					and osk1.始値 is not null
				group by
					osk1.日付
			) as tosk
		on
			osk2.日付 = tosk.日付
			and osk2.限月 = tosk.限月
			and osk2.取引種別 = '11'
			and osk2.商品 = '31'
			and osk2.始値 is not null
	) as osk3
on
	hk.日付 = osk3.日付


GO


