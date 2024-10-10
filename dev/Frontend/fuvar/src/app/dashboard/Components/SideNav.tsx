import SideNavLink from "./SideNavLink"

export default function SideNav(){
    return (
        <div className="h-screen py-6">
            <div className="bg-[--foreground] text-[--background] w-[300px] h-full">
                <div className="text-2xl w-full py-4 pl-4">Dashboard</div>
                <div className="flex flex-col w-fit px-4 gap-y-2">
                    <SideNavLink href="#" text="link1" />
                    <SideNavLink href="#" text="link2" />
                    <SideNavLink href="#" text="link3" />
                    <SideNavLink href="#" text="link4" />
                </div>
            </div>
        </div>
    )
}