USE [PRICE]
GO

/****** Object:  View [dbo].[��_����]    Script Date: 2017/11/19 15:34:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[��_����]
AS
SELECT
		hk.*
	,	gsk3.�����s�g���i as ��_�����s�g���i
	,	gsk3.�n�l as ��_�n�l
	,	gsk3.���l as ��_���l
	,	gsk3.���l as ��_���l
	,	gsk3.�I�l as ��_�I�l
	
	,	osk3.�����s�g���i as �Ζ�_�����s�g���i
	,	osk3.�n�l as �Ζ�_�n�l
	,	osk3.���l as �Ζ�_���l
	,	osk3.���l as �Ζ�_���l
	,	osk3.�I�l as �Ζ�_�I�l

FROM
	���ϊ��� as hk
inner join
	(
		select
			gsk2.*
		from
			���i���i as gsk2
		inner join
			(
				select
						gsk1.���t
					,	min(gsk1.����) as ����
				from
					���i���i as gsk1
				where
					gsk1.������ = '11'
					and gsk1.���i = '11'
					and gsk1.�n�l is not null
				group by
					gsk1.���t
			) as tgsk
		on
			gsk2.���t = tgsk.���t
			and gsk2.���� = tgsk.����
			and gsk2.������ = '11'
			and gsk2.���i = '11'
			and gsk2.�n�l is not null
	) as gsk3
on
	hk.���t = gsk3.���t
inner join
	(
		select
			osk2.*
		from
			���i���i as osk2
		inner join
			(
				select
						osk1.���t
					,	min(osk1.����) as ����
				from
					���i���i as osk1
				where
					osk1.������ = '11'
					and osk1.���i = '31'
					and osk1.�n�l is not null
				group by
					osk1.���t
			) as tosk
		on
			osk2.���t = tosk.���t
			and osk2.���� = tosk.����
			and osk2.������ = '11'
			and osk2.���i = '31'
			and osk2.�n�l is not null
	) as osk3
on
	hk.���t = osk3.���t


GO


