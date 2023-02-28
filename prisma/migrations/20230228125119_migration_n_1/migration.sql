-- CreateTable
CREATE TABLE `account` (
    `balance` DOUBLE NOT NULL,
    `UserId` INTEGER NOT NULL,
    `CurrencyId` INTEGER NOT NULL,
    `account_guid` VARCHAR(191) NOT NULL,
    `account_id` INTEGER NOT NULL AUTO_INCREMENT,

    INDEX `Account_CurrencyId_fkey`(`CurrencyId`),
    INDEX `Account_UserId_fkey`(`UserId`),
    PRIMARY KEY (`account_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `currency` (
    `currency_guid` VARCHAR(191) NOT NULL,
    `currency_id` INTEGER NOT NULL AUTO_INCREMENT,
    `currency_name` VARCHAR(191) NOT NULL,
    `currency_symbol` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`currency_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transfer` (
    `amount` DOUBLE NOT NULL,
    `description` VARCHAR(191) NULL,
    `OriginAccountId` INTEGER NOT NULL,
    `DestinyAccountId` INTEGER NOT NULL,
    `created` DATETIME(3) NOT NULL,
    `transfer_guid` VARCHAR(191) NOT NULL,
    `transfer_id` INTEGER NOT NULL AUTO_INCREMENT,

    INDEX `transfer_DestinyAccountId_fkey`(`DestinyAccountId`),
    INDEX `transfer_OriginAccountId_fkey`(`OriginAccountId`),
    PRIMARY KEY (`transfer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `password` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `lastname` VARCHAR(191) NOT NULL,
    `user_guid` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `account` ADD CONSTRAINT `Account_CurrencyId_fkey` FOREIGN KEY (`CurrencyId`) REFERENCES `currency`(`currency_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `account` ADD CONSTRAINT `Account_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transfer` ADD CONSTRAINT `transfer_DestinyAccountId_fkey` FOREIGN KEY (`DestinyAccountId`) REFERENCES `account`(`account_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transfer` ADD CONSTRAINT `transfer_OriginAccountId_fkey` FOREIGN KEY (`OriginAccountId`) REFERENCES `account`(`account_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
