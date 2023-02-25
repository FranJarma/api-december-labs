import prisma from "../adapters/prisma-client"

export const getUsers = async () => {
    const users = await prisma.user.findMany();
    return users;
}