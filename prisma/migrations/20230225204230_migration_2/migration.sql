/*
  Warnings:

  - The primary key for the `account` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `accountGuid` on the `account` table. All the data in the column will be lost.
  - You are about to drop the column `accountId` on the `account` table. All the data in the column will be lost.
  - The primary key for the `currency` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `currencyGuid` on the `currency` table. All the data in the column will be lost.
  - You are about to drop the column `currencyId` on the `currency` table. All the data in the column will be lost.
  - You are about to drop the column `currencyName` on the `currency` table. All the data in the column will be lost.
  - You are about to drop the column `currencySymbol` on the `currency` table. All the data in the column will be lost.
  - The primary key for the `transaction` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `dateTime` on the `transaction` table. All the data in the column will be lost.
  - You are about to drop the column `transactionGuid` on the `transaction` table. All the data in the column will be lost.
  - You are about to drop the column `transactionId` on the `transaction` table. All the data in the column will be lost.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `lastName` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `userGuid` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `userName` on the `user` table. All the data in the column will be lost.
  - The required column `account_guid` was added to the `Account` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `account_id` to the `Account` table without a default value. This is not possible if the table is not empty.
  - The required column `currency_guid` was added to the `Currency` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `currency_id` to the `Currency` table without a default value. This is not possible if the table is not empty.
  - Added the required column `currency_name` to the `Currency` table without a default value. This is not possible if the table is not empty.
  - Added the required column `currency_symbol` to the `Currency` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - The required column `transaction_Guid` was added to the `Transaction` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `transaction_Id` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastname` to the `User` table without a default value. This is not possible if the table is not empty.
  - The required column `user_guid` was added to the `User` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `user_id` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `account` DROP FOREIGN KEY `Account_CurrencyId_fkey`;

-- DropForeignKey
ALTER TABLE `account` DROP FOREIGN KEY `Account_UserId_fkey`;

-- DropForeignKey
ALTER TABLE `transaction` DROP FOREIGN KEY `Transaction_DestinyAccountId_fkey`;

-- DropForeignKey
ALTER TABLE `transaction` DROP FOREIGN KEY `Transaction_OriginAccountId_fkey`;

-- AlterTable
ALTER TABLE `account` DROP PRIMARY KEY,
    DROP COLUMN `accountGuid`,
    DROP COLUMN `accountId`,
    ADD COLUMN `account_guid` VARCHAR(191) NOT NULL,
    ADD COLUMN `account_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`account_id`);

-- AlterTable
ALTER TABLE `currency` DROP PRIMARY KEY,
    DROP COLUMN `currencyGuid`,
    DROP COLUMN `currencyId`,
    DROP COLUMN `currencyName`,
    DROP COLUMN `currencySymbol`,
    ADD COLUMN `currency_guid` VARCHAR(191) NOT NULL,
    ADD COLUMN `currency_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `currency_name` VARCHAR(191) NOT NULL,
    ADD COLUMN `currency_symbol` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`currency_id`);

-- AlterTable
ALTER TABLE `transaction` DROP PRIMARY KEY,
    DROP COLUMN `dateTime`,
    DROP COLUMN `transactionGuid`,
    DROP COLUMN `transactionId`,
    ADD COLUMN `created` DATETIME(3) NOT NULL,
    ADD COLUMN `transaction_Guid` VARCHAR(191) NOT NULL,
    ADD COLUMN `transaction_Id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`transaction_Id`);

-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    DROP COLUMN `lastName`,
    DROP COLUMN `userGuid`,
    DROP COLUMN `userId`,
    DROP COLUMN `userName`,
    ADD COLUMN `lastname` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_guid` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `username` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`user_id`);

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_CurrencyId_fkey` FOREIGN KEY (`CurrencyId`) REFERENCES `Currency`(`currency_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_OriginAccountId_fkey` FOREIGN KEY (`OriginAccountId`) REFERENCES `Account`(`account_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_DestinyAccountId_fkey` FOREIGN KEY (`DestinyAccountId`) REFERENCES `Account`(`account_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
