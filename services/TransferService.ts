import { Transfer } from '../interfaces/Transfer';
import { getUserById } from './UserService';
import { convertCurrencies, getCurrencyById } from './CurrencyService';
import prisma from '../adapters/prisma-client';

export const createTransfer = async (transfer: Transfer) => {
    try {
        const { accountFrom, accountTo, amount, date, description, userGuid } = transfer;
        const accountToUser = await getUserById(accountTo.UserId);
        const currencyFrom = await getCurrencyById(accountFrom.CurrencyId);
        const currencyTo = await getCurrencyById(accountTo.CurrencyId);

        const newTransfer = await prisma.transfer.create({
            data: {
                amount: accountFrom.CurrencyId !== accountTo.CurrencyId ? await convertCurrencies(currencyFrom?.currency_symbol ?? 'URU', currencyTo?.currency_symbol ?? 'USD', accountToUser?.user_guid !== userGuid ? amount + (amount * 0.1) : amount) : amount,
                created: date,
                description: description,
                DestinyAccountId: accountTo.account_id,
                OriginAccountId: accountFrom.account_id
            }
        });

        return newTransfer;

    } catch (error) {
        console.log(error);
    }
}

export const getTransfers = async () => {
    try {
        const transfers = await prisma.transfer.findMany({
            orderBy: [
                {
                    created: 'desc'
                }
            ]
        });
        return transfers;
    } catch (error) {
        console.log(error);
    }
}