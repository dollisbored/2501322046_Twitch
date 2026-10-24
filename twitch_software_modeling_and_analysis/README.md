Софтуерно моделиране и анализ

Студентски номер: 2501322046
Име: Беркай Бахкир

- Тема: Twitch

	1. Концертуална диаграма
	2. Логически диаграма
	3. База от данни
	4. PowerBI диаграми

- Примерни тестови команди за базата данни:

	SELECT dbo.fn_GetChannelRevenue(1) AS ChannelOneRevenue;
	SELECT dbo.fn_GetUserMessageCount(2) AS UserTwoMessageCount;

	EXEC sp_StartStream @ChanID = 2, @CatID = 1, @StreamTitle = 'Late night chat';
	EXEC sp_ChannelReport @ChanID = 1;

	INSERT INTO Subscription (UserID, ChannelID, Tier, Price)  VALUES (3, 2, 1, -5.00);

	SELECT ViewCount AS ViewersBefore FROM Stream WHERE StreamID = 1;
	INSERT INTO ChatMessage (StreamID, UserID, Content) VALUES (1, 2, 'Trigger test!');
	SELECT ViewCount AS ViewersAfter FROM Stream WHERE StreamID = 1;