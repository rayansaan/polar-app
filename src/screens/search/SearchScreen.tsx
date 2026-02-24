import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  FlatList,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { colors, spacing, typography, borderRadius } from '../../theme';
import { useAppStore } from '../../store';
import { GENRES, DEMO_DIRECTORS, DEMO_CATEGORIES } from '../../data/demoMovies';
import { FilterType, Genre } from '../../types';

interface SearchScreenProps {
  navigation: any;
}

export const SearchScreen: React.FC<SearchScreenProps> = ({ navigation }) => {
  const {
    searchQuery,
    setSearchQuery,
    selectedFilter,
    setSelectedFilter,
    filteredMovies,
    selectedGenres,
    setSelectedGenres,
  } = useAppStore();

  const filters: { key: FilterType; label: string }[] = [
    { key: 'films', label: 'Films' },
    { key: 'series', label: 'Séries' },
    { key: 'directors', label: 'Réalisateurs' },
    { key: 'actors', label: 'Acteurs' },
  ];

  const toggleGenre = (genre: Genre) => {
    if (selectedGenres.includes(genre)) {
      setSelectedGenres(selectedGenres.filter((g) => g !== genre));
    } else {
      setSelectedGenres([...selectedGenres, genre]);
    }
  };

  const renderFilters = () => (
    <ScrollView 
      horizontal 
      showsHorizontalScrollIndicator={false}
      style={styles.filtersContainer}
      contentContainerStyle={styles.filtersContent}
    >
      {filters.map((filter) => (
        <TouchableOpacity
          key={filter.key}
          style={[
            styles.filterPill,
            selectedFilter === filter.key && styles.filterPillActive,
          ]}
          onPress={() => setSelectedFilter(filter.key)}
        >
          <Text
            style={[
              styles.filterText,
              selectedFilter === filter.key && styles.filterTextActive,
            ]}
          >
            {filter.label}
          </Text>
        </TouchableOpacity>
      ))}
    </ScrollView>
  );

  const renderCategories = () => (
    <View style={styles.categoriesContainer}>
      <Text style={styles.sectionTitle}>Catégories</Text>
      <View style={styles.categoriesGrid}>
        {DEMO_CATEGORIES.map((category) => (
          <TouchableOpacity
            key={category.id}
            style={styles.categoryCard}
            onPress={() => {
              setSelectedGenres([category.genre]);
              setSearchQuery('');
            }}
          >
            <View style={styles.categoryImage}>
              <Text style={styles.categoryEmoji}>🎬</Text>
            </View>
            <Text style={styles.categoryName}>{category.name}</Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );

  const renderResults = () => {
    if (searchQuery.trim() === '' && selectedGenres.length === 0) {
      return renderCategories();
    }

    if (filteredMovies.length === 0) {
      return (
        <View style={styles.emptyState}>
          <Text style={styles.emptyText}>Aucun résultat trouvé</Text>
          <Text style={styles.emptySubtext}>Essayez avec d'autres mots-clés</Text>
        </View>
      );
    }

    return (
      <View style={styles.resultsContainer}>
        <Text style={styles.resultsCount}>
          {filteredMovies.length} résultat{filteredMovies.length !== 1 ? 's' : ''}
        </Text>
        {filteredMovies.map((movie) => (
          <TouchableOpacity
            key={movie.id}
            style={styles.resultCard}
            onPress={() => navigation.navigate('MovieDetail', { movieId: movie.id })}
          >
            <View style={styles.resultPoster}>
              <Text style={styles.resultEmoji}>🎥</Text>
            </View>
            <View style={styles.resultInfo}>
              <Text style={styles.resultTitle}>{movie.title}</Text>
              <Text style={styles.resultMeta}>
                {movie.year} • {movie.director}
              </Text>
              <View style={styles.resultRating}>
                <Text style={styles.resultRatingText}>★ {movie.polarRating}</Text>
              </View>
            </View>
          </TouchableOpacity>
        ))}
      </View>
    );
  };

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <View style={styles.header}>
        <Text style={styles.title}>Les Archives</Text>
      </View>
      
      <View style={styles.searchContainer}>
        <View style={styles.searchInputWrapper}>
          <Text style={styles.searchIcon}>🔍</Text>
          <TextInput
            style={styles.searchInput}
            placeholder="Rechercher..."
            placeholderTextColor={colors.textMuted}
            value={searchQuery}
            onChangeText={setSearchQuery}
          />
          {searchQuery.length > 0 && (
            <TouchableOpacity onPress={() => setSearchQuery('')}>
              <Text style={styles.clearIcon}>✕</Text>
            </TouchableOpacity>
          )}
        </View>
      </View>

      {renderFilters()}

      <ScrollView 
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        {renderResults()}
        <View style={styles.bottomPadding} />
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    paddingHorizontal: spacing.md,
    paddingTop: spacing.md,
  },
  title: {
    ...typography.h1,
    color: colors.text,
  },
  searchContainer: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.md,
  },
  searchInputWrapper: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    paddingHorizontal: spacing.md,
  },
  searchIcon: {
    fontSize: 18,
    marginRight: spacing.sm,
  },
  searchInput: {
    flex: 1,
    ...typography.body,
    color: colors.text,
    paddingVertical: spacing.md,
  },
  clearIcon: {
    color: colors.textMuted,
    fontSize: 16,
    padding: spacing.sm,
  },
  filtersContainer: {
    maxHeight: 50,
  },
  filtersContent: {
    paddingHorizontal: spacing.md,
    gap: spacing.sm,
  },
  filterPill: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.round,
    backgroundColor: colors.surface,
    marginRight: spacing.sm,
  },
  filterPillActive: {
    backgroundColor: colors.primary,
  },
  filterText: {
    ...typography.bodySmall,
    color: colors.textSecondary,
  },
  filterTextActive: {
    color: colors.text,
    fontWeight: '600',
  },
  scrollContent: {
    paddingTop: spacing.lg,
  },
  categoriesContainer: {
    paddingHorizontal: spacing.md,
  },
  sectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  categoriesGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.md,
  },
  categoryCard: {
    width: '47%',
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    overflow: 'hidden',
  },
  categoryImage: {
    height: 80,
    backgroundColor: colors.surfaceLight,
    justifyContent: 'center',
    alignItems: 'center',
  },
  categoryEmoji: {
    fontSize: 32,
  },
  categoryName: {
    ...typography.bodySmall,
    color: colors.text,
    padding: spacing.sm,
  },
  resultsContainer: {
    paddingHorizontal: spacing.md,
  },
  resultsCount: {
    ...typography.caption,
    color: colors.textSecondary,
    marginBottom: spacing.md,
  },
  resultCard: {
    flexDirection: 'row',
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    marginBottom: spacing.md,
    overflow: 'hidden',
  },
  resultPoster: {
    width: 80,
    height: 120,
    backgroundColor: colors.surfaceLight,
    justifyContent: 'center',
    alignItems: 'center',
  },
  resultEmoji: {
    fontSize: 30,
  },
  resultInfo: {
    flex: 1,
    padding: spacing.md,
    justifyContent: 'center',
  },
  resultTitle: {
    ...typography.h3,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  resultMeta: {
    ...typography.bodySmall,
    color: colors.textSecondary,
    marginBottom: spacing.sm,
  },
  resultRating: {
    backgroundColor: colors.primaryDark,
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.sm,
    alignSelf: 'flex-start',
  },
  resultRatingText: {
    ...typography.caption,
    color: colors.gold,
  },
  emptyState: {
    alignItems: 'center',
    paddingTop: spacing.xxl,
  },
  emptyText: {
    ...typography.body,
    color: colors.textSecondary,
  },
  emptySubtext: {
    ...typography.bodySmall,
    color: colors.textMuted,
    marginTop: spacing.sm,
  },
  bottomPadding: {
    height: 100,
  },
});

export default SearchScreen;
