import clienteAxios from '../adapters/axios';
import prisma from '../adapters/prisma-client';

export const getCurrencyById = async (id: number) => {
    try {
        const currency = await prisma.currency.findFirstOrThrow({
            where: {
                currency_id: id
            }
        });
        if (currency) return currency;
        return null;
    } catch (error) {
        console.log(error);
    }


}

export const convertCurrencies = async (currencyFromSymbol: string, currencyToSymbol: string, amount: number) => {
    try {
        const convertion = await clienteAxios.get(`https://api.apilayer.com/fixer/convert?to=${currencyToSymbol}&from=${currencyFromSymbol}&amount=${amount}`);
        return convertion.data.result;
    } catch (error) {
        console.log(error);
    }
}