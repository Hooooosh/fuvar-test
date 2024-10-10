'use client'
import { Component, ReactNode, useState } from "react"
import Link from "next/link";

import backgroundImages from "./Helpers/backgroundImages"
import { InputField, InputProps } from "./Components/InputField"
import InvalidInputText from "./Components/InvalidInputText"

export default function Home() {
  let [wallpaper, setWallpaper] = useState(`${backgroundImages[Math.floor(Math.random() * (backgroundImages.length))].src}`)

  return (
    <main className={
      `w-full h-screen bg-cover bg-center`}
      style={{ backgroundImage: `url('${wallpaper}')` }}>
      <div className="flex flex-col justify-center items-center backdrop-brightness-[40%] w-full h-full text-[--foreground] ">
        <LoginForm />
      </div>
    </main>
  )
}

function LoginForm() {
  let [login, setLogin] = useState("");
  let [password, setPassword] = useState("");
  let [showInvalid, setShowInvalid] = useState(true)

  function handleButtonPress(type: LoginButtonTypes) {
    tryLogin(login, password, type)
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
        <LoginButton url={"/dashboard"} callback={() => handleButtonPress(LoginButtonTypes.USER)} innerText="Login as Courier" loginType={LoginButtonTypes.USER} />
        <LoginButton url={"/dashboard"} callback={() => handleButtonPress(LoginButtonTypes.ADMIN)} innerText="Login as Administrator" loginType={LoginButtonTypes.ADMIN} />
      </div>
    </form>
  )
}

function tryLogin(user: string, password: string, type: LoginButtonTypes) {
  
}

function LoginButton(props: LoginButtonProps) {
  return (
    <Link href={props.url}>
      <button
        type="button"
        className={`w-full px-3 py-2 md:py-2 md:px-4 rounded-lg text-xl md:text-base md:text-nowrap duration-200 ring-2 hover:ring-0 ring-inset ring-[--background] text-white  
          ${props.loginType == LoginButtonTypes.ADMIN ? "bg-[#b84738]" : "bg-[#37a12f]"}`}
        onClick={() => props.callback("props.loginType")}
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
  callback: Function;
}
export enum LoginButtonTypes {
  ADMIN = "ADMIN",
  USER = "USER"
}