
const { BASE_URL } = process.env;

if(BASE_URL === undefined) {
    throw "process.env.BASE_URL is undefined"
}

const baseURL: string = BASE_URL

export type EnvVars = {
    baseURL: string
}

 const vars: EnvVars = {
    baseURL
}

export default vars