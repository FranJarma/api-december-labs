import prisma from "../adapters/prisma-client"

export const getUsers = async () => {
    try {
        const users = await prisma.user.findMany();
        return users;
    } catch (error) {
        console.log(error);
    }

}

export const getUserById = async (id: number) => {
    try {
        const user = await prisma.user.findFirstOrThrow({
            where: {
                user_id: id
            }
        });
        return user;
    } catch (error) {
        console.log(error);
    }

}