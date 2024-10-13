'use client'
import { useEffect, useState } from "react"
import Link from "next/link";

import backgroundImages from "@/app/helpers/backgroundImages"
import { InputField } from "@/app/components/InputField"
import InvalidInputText from "@/app/components/InvalidInputText"

export default function Home() {
  const [wallpaperSrc, setWallpaperSrc] = useState("")
  const [mobileWarnShown, setMobileWarnShown] = useState(false)

  useEffect(() => { //lefut betöltéskor
    const randomWallpaperSrc = backgroundImages[Math.floor(Math.random() * (backgroundImages.length))].src
    setWallpaperSrc("url(" + randomWallpaperSrc + ")")

    if (window.innerWidth < 768) {
      setMobileWarnShown(true)
    }
  }, []) // [] -> csak egyszer
  return (
    <>
      {/*sketchy ahh megoldás mer hidden= nem mükszik*/}
      {mobileWarnShown && <div id="mobileWarn" className="w-screen z-50 h-screen absolute top-0 left-0 flex justify-center items-center text-white bg-[rgba(0,0,0,0.7)]">

        <div className={`h-fit gap-2 border-x border-neutral-400 mx-4 py-8 px-2 flex flex-col items-center text-center justify-center`}>
          <p className="text-3xl">Warning:</p>
          <p className="text-2xl">This site is not meant to be viewed on mobile</p>
          <button onClick={() => { setMobileWarnShown(false) }} className="text-xl px-3 py-2 w-fit bg-white text-black ring-2 ring-[--background] rounded-lg">I understand</button>
        </div>
      </div>}

      <main className={
        `w-full h-screen bg-cover bg-center-`}
        style={{ backgroundImage: wallpaperSrc }}>
        <div className="flex flex-col justify-center items-center backdrop-brightness-[60%] w-full h-full text-[--foreground] ">
          <LoginForm />
        </div>
      </main>
    </>
  )
}

function LoginForm() {
  const [login, setLogin] = useState("");
  const [password, setPassword] = useState("");
  const [showInvalid, setShowInvalid] = useState(true)
  console.log(login, password)
  function handleButtonPress(type: LoginButtonTypes) {
    //tryLogin(login, password, type)
    setShowInvalid(type == LoginButtonTypes.ADMIN)
  }

  return (
    <form className="md:w-fit max-w-screen-md p-6 h-fit w-full bg-[--background] rounded-xl gap-y-5 md:gap-y-3 flex-col flex border-2 border-[--primary] ">
      <p className="text-3xl md:text-3xl font-medium mb-4">Asdasd</p>

      <InputField
        id="input1"
        labelText="Username"
        placeholder="kovacs.janos"
        type="text"
        keypressCallback={setLogin}
      />
      <InputField
        id="input2"
        labelText="Password"
        placeholder="●●●●●●●●●●●"
        type="password"
        keypressCallback={setPassword}
      />
      <InvalidInputText
        innerText="Invalid ID or password"
        shown={showInvalid} />

      <div className="flex justify-between mt-4 gap-x-4">
        <LoginButton url={"./routes/dashboard"} callback={() => handleButtonPress(LoginButtonTypes.USER)} innerText="Login as Courier" loginType={LoginButtonTypes.USER} />
        <LoginButton url={"./routes/dashboard"} callback={() => handleButtonPress(LoginButtonTypes.ADMIN)} innerText="Login as Administrator" loginType={LoginButtonTypes.ADMIN} />
      </div>
    </form>
  )
}
/*
function tryLogin(user: string, password: string, type: LoginButtonTypes) {
  
}
*/
function LoginButton(props: LoginButtonProps) {
  return (
    <Link href={props.url}>
      <button
        type="button"
        className={`w-full px-3 py-2 md:py-2 md:px-4 rounded-lg text-xl md:text-base md:text-nowrap 
          duration-200 ring-2 hover:ring-4 ring-[--secondary] bg-[--background] text-[--foreground]
          `} //${props.loginType == LoginButtonTypes.ADMIN ? "bg-[#b84738]" : "bg-[#37a12f]"}
        onClick={() => props.callback(props.loginType)}
      >
        {props.innerText}
      </button>
    </Link>
  )
}

export interface LoginButtonProps {
  loginType: LoginButtonTypes;
  innerText: string;
  url: string;
  callback: (type: LoginButtonTypes) => void;
}
export enum LoginButtonTypes {
  ADMIN = "ADMIN",
  USER = "USER"
}