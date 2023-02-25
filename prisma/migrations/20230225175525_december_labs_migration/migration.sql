-- CreateTable
CREATE TABLE `User` (
    `userId` INTEGER NOT NULL AUTO_INCREMENT,
    `userGuid` VARCHAR(191) NOT NULL,
    `userName` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Currency` (
    `currencyId` INTEGER NOT NULL AUTO_INCREMENT,
    `currencyGuid` VARCHAR(191) NOT NULL,
    `currencyName` VARCHAR(191) NOT NULL,
    `currencySymbol` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`currencyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Account` (
    `accountId` INTEGER NOT NULL AUTO_INCREMENT,
    `accountGuid` VARCHAR(191) NOT NULL,
    `balance` DOUBLE NOT NULL,
    `UserId` INTEGER NOT NULL,
    `CurrencyId` INTEGER NOT NULL,

    PRIMARY KEY (`accountId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transaction` (
    `transactionId` INTEGER NOT NULL AUTO_INCREMENT,
    `transactionGuid` VARCHAR(191) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `dateTime` DATETIME(3) NOT NULL,
    `description` VARCHAR(191) NULL,
    `OriginAccountId` INTEGER NOT NULL,
    `DestinyAccountId` INTEGER NOT NULL,

    PRIMARY KEY (`transactionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_CurrencyId_fkey` FOREIGN KEY (`CurrencyId`) REFERENCES `Currency`(`currencyId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_OriginAccountId_fkey` FOREIGN KEY (`OriginAccountId`) REFERENCES `Account`(`accountId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_DestinyAccountId_fkey` FOREIGN KEY (`DestinyAccountId`) REFERENCES `Account`(`accountId`) ON DELETE RESTRICT ON UPDATE CASCADE;
