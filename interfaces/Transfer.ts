import { Account } from "@prisma/client";

export interface Transfer {
    accountFrom: Account,
    accountTo: Account,
    amount: number,
    date: Date,
    description: string,
    userGuid: string
}