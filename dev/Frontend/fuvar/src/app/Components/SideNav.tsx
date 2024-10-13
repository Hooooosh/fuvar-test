'use client'
import SideNavLink from "@/app/components/SideNavLink"
import { ThreeHorizontalLines } from "@/app/images/svg/three-horizontal-lines"
import { useState } from "react";

export default function SideNav() {
    const [isOpen, setIsOpen] = useState(false);
    function handleClick() {
        setIsOpen(!isOpen)
    }
    return (
        <div className="h-screen w-fit py-6">
            <div className="h-full w-fit rounded-r-xl flex flex-col">
                <div onClick={handleClick} className={`z-50 ${isOpen ? "rounded-tr-xl" : "rounded-r-xl -translate-x-3/4 hover:ml-2"} flex justify-between bg-[--foreground] text-[--background] w-[300px] duration-300 `}>
                    <div className="text-2xl py-4 pl-4 select-none">Dashboard</div>
                    <div className="aspect-square flex items-center justify-center p-2">

                        <div className="cursor-pointer h-full aspect-square p-2 bg-gray-200 rounded-lg border-2 border-gray-700 hover:scale-110 duration-300">
                            <ThreeHorizontalLines />
                        </div>
                    </div>
                </div>
                <div className={`z-50 rounded-br-xl text-lg flex flex-col bg-[--foreground] text-[--background] w-[300px] p-4 h-full gap-y-2 duration-300 ${isOpen ? "" : "-translate-x-full"}`}>
                    <SideNavLink href="../routes/employees" text="Employees" />
                    <SideNavLink href="../routes/vehicles" text="Vehicles" />
                    <SideNavLink href="../routes/leasing" text="Vehicle leasing" />
                    <SideNavLink href="../routes/insurance" text="Vehicle insurance" />
                    <SideNavLink href="../routes/incidents" text="Incidents" />
                    <SideNavLink href="../routes/timeband" text="Work timeband" />
                    <SideNavLink href="../routes/work" text="Work assignment" />
                </div>
            </div>
        </div>
    )
}