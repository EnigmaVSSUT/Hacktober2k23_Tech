import React, { useState } from 'react';
import { FaBars, FaTimes } from 'react-icons/fa';
import { Link } from 'react-scroll';

const Navbar = () => {

    const [nav, setNav] = useState(false);

    let links = [
        {
            id: 1,
            link: "original repo",
        },
        {
            id: 2,
            link: "contributer",
        },
        {
            id: 3,
            link: "about",
        }
    ]

    return (

        <nav className='bg-gradient-to-r from-indigo-100 to-purple-100 flex justify-around h-20 items-center md:relative'>

            <a href='/' className="box-shadow-hover text-3xl font-bold">
                Hacktober2k23_Tech
            </a>

            <ul className="hidden md:flex">

                {links.map(({ id, link }) => {
                    return <li key={id} className='font-medium mx-2 md:mx-4 capitalize cursor-pointer'>
                        <Link to={link} smooth duration={500} className="px-4 py-2 hover:bg-purple-500 rounded-xl hover:text-white duration-300">
                            {link}
                        </Link>
                    </li>
                })}
                <li className='font-medium mx-2 md:mx-4 capitalize'>
                    <a href="/login" className="px-4 py-2 hover:bg-purple-500 rounded-xl hover:text-white duration-300">
                        Log In
                    </a>
                </li>
                <li className='font-medium mx-2 md:mx-4 capitalize'>
                    <a href="/signup" className="px-4 py-2 hover:bg-purple-500 rounded-xl hover:text-white duration-300">
                        Sign Up
                    </a>
                </li>

            </ul>

            <button className='md:hidden' onClick={() => setNav(!nav)}>
                {nav ? <FaTimes size={20} /> : <FaBars size={20} />}
            </button>

            <ul className={`flex flex-col justify-center items-center md:hidden absolute top-0 left-0 ${nav ? 'h-[40vh]' : 'h-0'} w-full ${nav ? 'translate-y-16' : '-translate-y-40'}  duration-300 ease-in-out bg-gradient-to-r from-indigo-100 to-purple-100 rounded-b-full`}>
                {links.map(({ id, link }) => {
                    return <li key={id} className='font-medium py-2 mx-2 md:mx-4 capitalize cursor-pointer'>
                        <Link to={link} onClick={() => setNav(!nav)} smooth duration={500} className="text-lg px-4 py-2 hover:bg-purple-500 rounded-xl hover:text-white duration-300">
                            {link}
                        </Link>
                    </li>
                })}
                <li className='font-medium mx-2 py-2 md:mx-4 capitalize'>
                    <a href="/login" className="text-lg px-4 py-2 hover:bg-purple-500 rounded-xl hover:text-white duration-300">
                        Log In
                    </a>
                </li>
                <li className='font-medium mx-2 py-2 md:mx-4 capitalize'>
                    <a href="/signup" className="text-lg px-4 py-2 hover:bg-purple-500 rounded-xl hover:text-white duration-300">
                        Sign Up
                    </a>
                </li>
            </ul>

        </nav>

    )
}

export default Navbar