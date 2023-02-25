/*
  Warnings:

  - The primary key for the `transaction` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `transaction_Guid` on the `transaction` table. All the data in the column will be lost.
  - You are about to drop the column `transaction_Id` on the `transaction` table. All the data in the column will be lost.
  - The required column `transaction_guid` was added to the `Transaction` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `transaction_id` to the `Transaction` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `transaction` DROP PRIMARY KEY,
    DROP COLUMN `transaction_Guid`,
    DROP COLUMN `transaction_Id`,
    ADD COLUMN `transaction_guid` VARCHAR(191) NOT NULL,
    ADD COLUMN `transaction_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`transaction_id`);
