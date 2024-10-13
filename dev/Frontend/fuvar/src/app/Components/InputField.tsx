
export interface InputProps {
    id: string;
    labelText: string;
    placeholder: string;
    type: string;
    keypressCallback: (key : string) => void;
}

export function InputField(props: InputProps) {
    const handleInput = (event: React.FormEvent<HTMLInputElement>) => {
        console.log(event.currentTarget.value)
        //props.keypressCallback(event.target.value)
    }
    return (
        <div className="flex flex-col gap-y-1">
            <label
                className="text-xl md:text-base"
                htmlFor={props.id}>
                {props.labelText}
            </label>
            <input
                className="pl-2 py-2 md:pl-3 md:py-2 rounded-md text-xl md:text-base outline-none duration-200 ring-[--primary] ring-2 focus:ring-[--secondary] focus:ring-2 bg-[--background]"
                type={props.type}
                id={props.id}
                placeholder={props.placeholder}
                onInput={handleInput}
                required>
            </input>
        </div>
    )
}