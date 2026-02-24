import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { colors, spacing, typography, borderRadius } from '../../theme';
import { useAppStore } from '../../store';
import { DEMO_DIRECTORS, GENRES } from '../../data/demoMovies';

const { width, height } = Dimensions.get('window');

interface MapScreenProps {
  navigation: any;
}

interface Node {
  id: string;
  type: 'movie' | 'director' | 'genre';
  label: string;
  x: number;
  y: number;
}

const initialNodes: Node[] = [
  { id: 'se7en', type: 'movie', label: 'Se7en', x: width / 2, y: height / 3 },
  { id: 'fincher', type: 'director', label: 'David Fincher', x: width / 4, y: height / 2 },
  { id: 'thriller', type: 'genre', label: 'Thriller', x: width * 0.75, y: height / 2 },
  { id: 'bradpitt', type: 'movie', label: 'Brad Pitt', x: width / 3, y: height * 0.6 },
  { id: 'zodiac', type: 'movie', label: 'Zodiac', x: width * 0.7, y: height * 0.6 },
];

export const MapScreen: React.FC<MapScreenProps> = ({ navigation }) => {
  const [nodes, setNodes] = useState<Node[]>(initialNodes);
  const [selectedNode, setSelectedNode] = useState<Node | null>(null);
  const [viewMode, setViewMode] = useState<'map' | 'list'>('map');

  const handleNodePress = (node: Node) => {
    setSelectedNode(node);
  };

  const renderMapView = () => (
    <View style={styles.mapContainer}>
      <View style={styles.mapBackground}>
        <Text style={styles.mapEmoji}>🎯</Text>
      </View>
      
      {nodes.map((node) => (
        <TouchableOpacity
          key={node.id}
          style={[
            styles.node,
            node.type === 'movie' && styles.nodeMovie,
            node.type === 'director' && styles.nodeDirector,
            node.type === 'genre' && styles.nodeGenre,
            selectedNode?.id === node.id && styles.nodeSelected,
          ]}
          onPress={() => handleNodePress(node)}
        >
          <Text style={styles.nodeLabel}>{node.label}</Text>
        </TouchableOpacity>
      ))}
      
      <View style={styles.connections}>
        {nodes.map((node, index) => {
          if (index === 0) return null;
          return (
            <View
              key={`line-${index}`}
              style={[
                styles.connectionLine,
                {
                  left: nodes[0].x,
                  top: nodes[0].y,
                  width: Math.abs(node.x - nodes[0].x),
                  transform: [
                    { rotate: `${Math.atan2(node.y - nodes[0].y, node.x - nodes[0].x) * (180 / Math.PI)}deg` },
                  ],
                },
              ]}
            />
          );
        })}
      </View>
    </View>
  );

  const renderListView = () => (
    <View style={styles.listContainer}>
      <Text style={styles.listTitle}>Tableau d'Investigation</Text>
      <Text style={styles.listSubtitle}>Connexions entre films, réalisateurs et genres</Text>
      
      <View style={styles.listSection}>
        <Text style={styles.listSectionTitle}>Réalisateurs</Text>
        {DEMO_DIRECTORS.slice(0, 8).map((director, index) => (
          <TouchableOpacity key={index} style={styles.listItem}>
            <View style={styles.listItemIcon}>
              <Text>🎬</Text>
            </View>
            <Text style={styles.listItemText}>{director}</Text>
            <Text style={styles.listItemArrow}>›</Text>
          </TouchableOpacity>
        ))}
      </View>
      
      <View style={styles.listSection}>
        <Text style={styles.listSectionTitle}>Genres</Text>
        {GENRES.slice(0, 6).map((genre, index) => (
          <TouchableOpacity key={index} style={styles.listItem}>
            <View style={styles.listItemIcon}>
              <Text>🎭</Text>
            </View>
            <Text style={styles.listItemText}>{genre}</Text>
            <Text style={styles.listItemArrow}>›</Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <View style={styles.header}>
        <Text style={styles.title}>Tableau d'Investigation</Text>
        <TouchableOpacity
          style={styles.viewToggle}
          onPress={() => setViewMode(viewMode === 'map' ? 'list' : 'map')}
        >
          <Text style={styles.viewToggleText}>
            {viewMode === 'map' ? '📋 Liste' : '🗺️ Map'}
          </Text>
        </TouchableOpacity>
      </View>
      
      {viewMode === 'map' ? renderMapView() : renderListView()}
      
      {selectedNode && (
        <View style={styles.detailCard}>
          <View style={styles.detailHeader}>
            <Text style={styles.detailType}>
              {selectedNode.type === 'movie' ? '🎬 Film' : 
               selectedNode.type === 'director' ? '🎬 Réalisateur' : '🎭 Genre'}
            </Text>
            <TouchableOpacity onPress={() => setSelectedNode(null)}>
              <Text style={styles.detailClose}>✕</Text>
            </TouchableOpacity>
          </View>
          <Text style={styles.detailTitle}>{selectedNode.label}</Text>
          {selectedNode.type === 'movie' && (
            <TouchableOpacity 
              style={styles.detailButton}
              onPress={() => {
                navigation.navigate('MovieDetail', { movieId: selectedNode.id });
                setSelectedNode(null);
              }}
            >
              <Text style={styles.detailButtonText}>Voir les détails</Text>
            </TouchableOpacity>
          )}
        </View>
      )}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.md,
  },
  title: {
    ...typography.h2,
    color: colors.text,
  },
  viewToggle: {
    backgroundColor: colors.surface,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.md,
  },
  viewToggleText: {
    ...typography.bodySmall,
    color: colors.text,
  },
  mapContainer: {
    flex: 1,
    position: 'relative',
  },
  mapBackground: {
    position: 'absolute',
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    opacity: 0.3,
  },
  mapEmoji: {
    fontSize: 100,
  },
  node: {
    position: 'absolute',
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.round,
    borderWidth: 2,
  },
  nodeMovie: {
    backgroundColor: colors.primary,
    borderColor: colors.primary,
  },
  nodeDirector: {
    backgroundColor: colors.surface,
    borderColor: colors.gold,
  },
  nodeGenre: {
    backgroundColor: colors.surface,
    borderColor: colors.accent,
  },
  nodeSelected: {
    borderColor: colors.text,
    transform: [{ scale: 1.1 }],
  },
  nodeLabel: {
    ...typography.bodySmall,
    color: colors.text,
    fontWeight: '600',
  },
  connections: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
  },
  connectionLine: {
    position: 'absolute',
    height: 2,
    backgroundColor: colors.border,
    transformOrigin: 'left center',
  },
  listContainer: {
    flex: 1,
    paddingHorizontal: spacing.md,
  },
  listTitle: {
    ...typography.h2,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  listSubtitle: {
    ...typography.bodySmall,
    color: colors.textSecondary,
    marginBottom: spacing.lg,
  },
  listSection: {
    marginBottom: spacing.lg,
  },
  listSectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  listItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.surface,
    padding: spacing.md,
    borderRadius: borderRadius.md,
    marginBottom: spacing.sm,
  },
  listItemIcon: {
    marginRight: spacing.md,
  },
  listItemText: {
    ...typography.body,
    color: colors.text,
    flex: 1,
  },
  listItemArrow: {
    ...typography.h3,
    color: colors.textMuted,
  },
  detailCard: {
    position: 'absolute',
    bottom: 100,
    left: spacing.md,
    right: spacing.md,
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    padding: spacing.md,
  },
  detailHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  detailType: {
    ...typography.caption,
    color: colors.primary,
  },
  detailClose: {
    ...typography.body,
    color: colors.textMuted,
  },
  detailTitle: {
    ...typography.h3,
    color: colors.text,
    marginBottom: spacing.md,
  },
  detailButton: {
    backgroundColor: colors.primary,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.md,
    alignItems: 'center',
  },
  detailButtonText: {
    ...typography.button,
    color: colors.text,
  },
});

export default MapScreen;
