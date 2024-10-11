import SideNav from "@/app/components/SideNav";

export default function Page(){
    return (
        <main>
            <SideNav />
            <div className="absolute top-0 w-screen h-screen flex items-center justify-center text-3xl text-white">timeband</div>
        </main>
    )
}