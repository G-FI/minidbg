#ifndef MINIDBG_DEBUGGER_HPP
#define MINIDBG_DEBUGGER_HPP

#include <utility>
#include <string>
#include <linux/types.h>
#include <unordered_map>

#include "breakpoint.hpp"
#include "dwarf/dwarf++.hh"
#include "elf/elf++.hh"

namespace minidbg {
    class debugger {
    enum class symbol_type{
            notype,
            object,
            func,
            section,
            file,
    };

    std::string to_string(symbol_type st){
        switch(st){
        case symbol_type::notype : return "notype";
        case symbol_type::object : return "ogject";
        case symbol_type::func : return "func";
        case symbol_type::section : return "section";
        case symbol_type::file : return "file";
        default : return "notype";
        }
    }

    //entrys in symtal have a data member, which cantains all information of a symtbl entry
    //and one of is stt it's 
    symbol_type to_symbol_type(elf::stt sym){
        switch(sym){
        case elf::stt::notype : return symbol_type::notype;
        case elf::stt::object : return symbol_type::object;
        case elf::stt::func : return symbol_type::func;
        case elf::stt::section : return symbol_type::section;
        case elf::stt::file : return symbol_type::file;
        default: return symbol_type::notype;
        }
    }

    struct symbol{
        symbol_type type;
        std::string name;
        std::uintptr_t addr;
    };

    public:
        debugger (std::string prog_name, pid_t pid)
             : m_prog_name{std::move(prog_name)}, m_pid{pid} {
            auto fd = open(m_prog_name.c_str(), O_RDONLY);

            m_elf = elf::elf{elf::create_mmap_loader(fd)};
            m_dwarf = dwarf::dwarf{dwarf::elf::create_loader(m_elf)};
        }

        void run();
        void set_breakpoint_at_address(std::intptr_t addr);
        void dump_registers();
        void print_source(const std::string& file_name, unsigned line, unsigned n_lines_context=2);

    private:
        void handle_command(const std::string& line);
        void continue_execution();
        auto get_pc() -> uint64_t;
        void set_pc(uint64_t pc);
        void step_over_breakpoint();
        void wait_for_signal();
        auto get_signal_info() -> siginfo_t;

        void handle_sigtrap(siginfo_t info);

        void initialise_load_address();
        uint64_t offset_load_address(uint64_t addr);

        auto get_function_from_pc(uint64_t pc) -> dwarf::die;
        auto get_line_entry_from_pc(uint64_t pc) -> dwarf::line_table::iterator;

        auto read_memory(uint64_t address) -> uint64_t ;
        void write_memory(uint64_t address, uint64_t value);

        void single_step_instruction();
        void single_step_with_breakpoint_check();
        void step_in();
        void step_out();
        void step_over();
        auto get_offset_pc()->uint64_t;
        void remove_breakpoint(std::intptr_t addr);
        auto offset_dwarf_address(uint64_t addr)->uint64_t;//abs address
        void set_breakpoint_at_function(std::string name);
        void set_breakpoint_at_source_line(const std::string& file, unsigned line);
        std::vector<symbol> lookup_symtbl(const std::string &name);


        std::string m_prog_name;
        pid_t m_pid;
        uint64_t m_load_address = 0;
        std::unordered_map<std::intptr_t,breakpoint> m_breakpoints;
        dwarf::dwarf m_dwarf;
        elf::elf m_elf;
    };
}

#endif
