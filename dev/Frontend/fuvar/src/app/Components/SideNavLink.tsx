import Link from "next/link"
export default function({href, text}: {href: string, text: string}){
    return (
        <Link href={href} className="w-full py-1 px-3 rounded-lg border-2 border-[--secondary] hover:ml-3 duration-200">{text}</Link>
    )
}