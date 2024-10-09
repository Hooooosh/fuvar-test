'use client'
import { ReactNode, useState } from "react"

export default function Home() {
  return (
    <main>
      <div className="w-full h-screen flex flex-col justify-center items-center px-2 gap-y-2">
        <LoginForm />
      </div>
    </main>
  )
}

function LoginForm() {
  let [login, setLogin] = useState("");
  let [password, setPassword] = useState("");
  let [showInvalid, setShowInvalid] = useState(true)

  function handleButtonPress(type: loginButtonTypes) {
    tryLogin(login, password, type)
    setShowInvalid(type == loginButtonTypes.ADMIN)
  }

  return (
    <form className="md:w-fit max-w-screen-md p-4 h-fit w-full bg-neutral-200 rounded-lg gap-y-5 md:gap-y-3 flex-col flex">
      <p className="text-3xl md:text-4xl font-medium mb-4">Asdasd</p>


      <InputGroup
        id="input1"
        labelText="Username"
        placeholder="kovacs.janos"
        type="text"
        keypressCallback={setLogin}
      />
      <InputGroup
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
        <LoginButton callback={() => handleButtonPress(loginButtonTypes.USER)} innerText="Login as Courier" loginType={loginButtonTypes.USER} />
        <LoginButton callback={() => handleButtonPress(loginButtonTypes.ADMIN)} innerText="Login as Administrator" loginType={loginButtonTypes.ADMIN} />
      </div>

    </form>
  )
}

function tryLogin(user: string, password: string, type: loginButtonTypes) {

}

interface InputProps {
  id: string;
  labelText: string;
  placeholder: string;
  type: string;
  keypressCallback: Function;
}

enum loginButtonTypes {
  ADMIN = "ADMIN",
  USER = "USER"
}

interface LoginButtonProps {
  loginType: loginButtonTypes;
  innerText: string;
  callback: Function;
}

function InputGroup(props: InputProps) {
  function handleInput(event: any) {
    props.keypressCallback(event.target.value)
  }
  return (
    <div className="flex flex-col gap-y-1">
      <label
        className="text-xl md:text-base"
        htmlFor={props.id}>
        {props.labelText}
      </label>
      <input
        className="pl-2 py-2 md:pl-3 md:py-2 rounded-md text-xl md:text-base outline-none duration-200 ring-neutral-400 ring-2 focus:ring-neutral-500 focus:ring-4"
        type={props.type}
        id={props.id}
        placeholder={props.placeholder}
        onInput={handleInput}
        required>
      </input>
    </div>
  )
}

function LoginButton(props: LoginButtonProps) {
  return (
    <button
      type="button"
      className={`w-full px-3 py-2 md:py-2 md:px-4 rounded-lg text-xl md:text-base md:text-nowrap text-white duration-200 hover:text-black ring-inset hover:ring-2 ring-neutral-700 
        ${props.loginType == loginButtonTypes.ADMIN ? "bg-[#CF8841]" : "bg-[#41A9CF]"}`}
      onClick={() => props.callback("props.loginType")}
    >{props.innerText}</button>
  )
}

function InvalidInputText({ innerText, shown }: { innerText: string, shown: boolean }) {
  console.log(shown)
  return (
    <div className={`text-red-500 text-lg md:text-base duration-100 ${shown ? 'block' : 'hidden'}`} id="invalidUserPopup">{innerText}</div>
  )
}
