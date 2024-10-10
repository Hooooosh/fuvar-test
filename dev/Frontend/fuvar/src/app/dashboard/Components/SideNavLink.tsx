import Link from "next/link"
export default function({href, text}: {href: string, text: string}){
    return (
        <Link href={href} className="w-full p-2 pl-3 pr-5 rounded-lg border-2 border-r-0 border-[--secondary]">{text}</Link>
    )
}