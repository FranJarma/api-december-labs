import prisma from '../adapters/prisma-client';

export const getReportsByUser = async (from: string, to?: string) => {

    try {
        const transactionsReport = await prisma.$queryRaw`
        SELECT CONCAT(TRUNCATE((t1.Internal / (t1.Internal + t2.External))*100, 2), '%') as '% Internal Transactions',
        CONCAT(TRUNCATE((t2.External / (t1.Internal + t2.External))*100, 2), '%') as '% External Transactions',
        t1.Year, t1.Week, t1.username
        FROM
        (
        SELECT COUNT(transaction_id) AS 'Internal', YEAR(created) 'Year', WEEK(created) 'Week', UserOriginAccount.username
        FROM transaction
        INNER JOIN account AS OriginAccount ON OriginAccount.account_id = transaction.OriginAccountId
        INNER JOIN account AS DestinyAccount ON DestinyAccount.account_id = transaction.DestinyAccountId
        INNER JOIN user AS UserOriginAccount ON UserOriginAccount.user_id = OriginAccount.UserId
        INNER JOIN user AS UserDestinyAccount ON UserDestinyAccount.user_id = DestinyAccount.UserId
        WHERE UserOriginAccount.user_id = UserDestinyAccount.user_id
        AND transaction.created BETWEEN ${from} AND ${to}
        GROUP BY UserOriginAccount.username, YEAR(created), WEEK(created)
        ORDER BY UserOriginAccount.username ASC, YEAR(created) ASC, WEEK(created) ASC
        ) t1
        INNER JOIN
        (
        SELECT COUNT(transaction_id) AS 'External', YEAR(created) 'Year', WEEK(created) 'Week', UserOriginAccount.username
        FROM transaction
        INNER JOIN account AS OriginAccount ON OriginAccount.account_id = transaction.OriginAccountId
        INNER JOIN account AS DestinyAccount ON DestinyAccount.account_id = transaction.DestinyAccountId
        INNER JOIN user AS UserOriginAccount ON UserOriginAccount.user_id = OriginAccount.UserId
        INNER JOIN user AS UserDestinyAccount ON UserDestinyAccount.user_id = DestinyAccount.UserId
        WHERE UserOriginAccount.user_id != UserDestinyAccount.user_id
        AND transaction.created BETWEEN ${from} AND ${to}
        GROUP BY UserOriginAccount.username, YEAR(created), WEEK(created)
        ) t2
        ON t1.username = t2.username AND t1.Week = t2.Week;`
        return transactionsReport;

    } catch (error) {
        console.log(error);
    }
}