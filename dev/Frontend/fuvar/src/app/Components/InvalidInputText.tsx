export default function InvalidInputText({ innerText, shown }: { innerText: string, shown: boolean }) {
    return (
      <div className={`text-red-500 text-lg md:text-base duration-100 ${shown ? 'block' : 'hidden'}`} id="invalidUserPopup">{innerText}</div>
    )
}