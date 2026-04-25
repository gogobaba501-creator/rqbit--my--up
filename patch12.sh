cat << 'INNER_EOF' > /tmp/chunk_tracker_patch.sh
sed -i '/pub fn mark_chunk_downloaded(/i \    pub fn unmark_chunk_downloaded(&mut self, chunk_info: &ChunkInfo) {\n        let chunk_range = self.lengths.chunk_range(chunk_info.piece_index);\n        if let Some(mut chunk_range) = self.chunk_status.get_mut(chunk_range) {\n            chunk_range.set(chunk_info.chunk_index as usize, false);\n        }\n    }\n' crates/librqbit/src/chunk_tracker.rs
INNER_EOF
bash /tmp/chunk_tracker_patch.sh
