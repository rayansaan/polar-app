import React, { useState, useRef, useEffect } from 'react';
import { ChevronDown, Shuffle, Flame, Calendar, Star, ArrowDownAZ } from 'lucide-react';

export type SortOption = 'random' | 'popularity' | 'year-desc' | 'year-asc' | 'rating' | 'title';

interface SortDropdownProps {
  value: SortOption;
  onChange: (value: SortOption) => void;
}

const sortOptions: { value: SortOption; label: string; icon: React.ReactNode }[] = [
  { value: 'random', label: 'Aléatoire', icon: <Shuffle className="w-4 h-4" /> },
  { value: 'popularity', label: 'Popularité', icon: <Flame className="w-4 h-4" /> },
  { value: 'year-desc', label: 'Plus récent', icon: <Calendar className="w-4 h-4" /> },
  { value: 'year-asc', label: 'Plus ancien', icon: <Calendar className="w-4 h-4" /> },
  { value: 'rating', label: 'Note', icon: <Star className="w-4 h-4" /> },
  { value: 'title', label: 'Titre A-Z', icon: <ArrowDownAZ className="w-4 h-4" /> },
];

export const SortDropdown: React.FC<SortDropdownProps> = ({ value, onChange }) => {
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  const selectedOption = sortOptions.find((opt) => opt.value === value);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  return (
    <div className="relative" ref={dropdownRef}>
      <button
        type="button"
        onClick={() => setIsOpen(!isOpen)}
        className="flex items-center gap-2 px-4 py-2 bg-polar-surface border border-polar-border text-sm text-polar-ink hover:border-polar-ink-2 transition-colors"
      >
        {selectedOption?.icon}
        <span>{selectedOption?.label}</span>
        <ChevronDown className={`w-4 h-4 transition-transform ${isOpen ? 'rotate-180' : ''}`} />
      </button>

      {isOpen && (
        <div className="absolute right-0 mt-1 w-48 bg-polar-white border border-polar-border shadow-lg z-50">
          {sortOptions.map((option) => (
            <button
              key={option.value}
              type="button"
              onClick={() => {
                onChange(option.value);
                setIsOpen(false);
              }}
              className={`w-full flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-polar-surface transition-colors ${
                value === option.value ? 'text-polar-ink font-medium bg-polar-surface' : 'text-polar-ink-2'
              }`}
            >
              {option.icon}
              {option.label}
            </button>
          ))}
        </div>
      )}
    </div>
  );
};

export default SortDropdown;
